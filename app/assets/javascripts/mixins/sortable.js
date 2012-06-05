// ==========================================================================
// Project:  Ember Runtime
// Copyright: ©2011 Strobe Inc. and contributors.
// License:   Licensed under MIT license (see license.js)
// ==========================================================================

// ..........................................................
// CONSTANTS
//

var OUT_OF_RANGE_EXCEPTION = "Index out of range" ;
var EMPTY = [];

// ..........................................................
// HELPERS
//

var get = Ember.get, set = Ember.set, forEach = Ember.ArrayUtils.forEach;
/**
 @class

     This mixin defines the API for sorting generic enumerables.  These methods
 can be applied to an object regardless of whether it is ordered or
 unordered.

 In order for the sorting to succeed, each added item must implement
 the method 'orderBy', which returns a computed property
 of the item's value to sort on.

 An Ember.SortedArrayProxy wraps Ember.ArrayProxy to keep the 'content' array sorted
 as Ember.Object items are added and removed.

 In order for the sorting to succeed, each added item must implement
 the method 'orderBy', which returns a computed property
 of the item's value to sort on.

 Since this collection is continually sorted as items are
 added and deleted,
 invoking modifying methods other than 'add' and 'remove' will, at best, corrupt the order of
 the array's items and, at worst, drop some and/or double items up.

 On the other hand, you can safely remove everything from the collection using the method 'purge'.

 A simple example of usage:

 // Define an Ember.Object to be put into the sorted array:
 var Pet = Ember.Object.extend({
 name: null,
 description: null,

 // Sort on the pet's name case-insensitive.  Note how this
 // method is implemented as a computed property.
 orderBy: Ember.computed(function() {
 return this.get('name').toUpperCase();
 }).property('name')
 });

 // Create the sorted array:
 var sortedPets = Ember.sortedPetsProxy.create();

 // Add some pets to it.
 sortedPets.add(Pet.create({
 name: 'Dog',
 description: 'furry friendly'
 }));
 sortedPets.add(Pet.create({
 name: 'cat',
 description: 'furry aloof'
 }));
 sortedPets.add(Pet.create({
 name: 'fish',
 description: 'scaly wet'
 }));

 // Examine how they're sorted:
 var actualArrayResult = sortedPets.map(function(item, index, self) {
 return item.get('name');
 }); // => ['cat', 'Dog', 'fish'];

 // Remove the cat:
 var cat = sortedPets.objectAtContent(0);
 sortedPets.remove(cat);

 // See what's left:
 actualArrayResult = sortedPets.map(function(item, index, self) {
 return item.get('name');
 }); // => ['Dog', 'fish'];

 // Clear all contents:
 sortedPets.purge(); // => []; DON'T USE clear()

 @extends Ember.ArrayProxy
 @extends Ember.Object
 @extends Ember.Array
 @extends Ember.MutableArray
 */
Ember.Sortable = Ember.Mixin.create(
    /** @scope Ember.Sortable.prototype */ {

        /**
         * Adds a new item to the list and ensures it is
         * sorted correctly.
         *
         * @param {Ember.Object} item the item to insert.  The item's class must implement 'orderBy' as a computed property.
         */
        add: function(item) {
            var length, idx;
            console.log(item);

            length = this.get('length');
            idx = this.binarySearch(item.get('orderBy'), 0, length);

            this.insertAt(idx, item);

            // If the value by which we've sorted the item
            // changes, we need to re-insert it at the correct
            // location in the list.
            item.addObserver('orderBy', this, 'itemSortValueDidChange');
        },

        /**
         * Removes an item from the list
         *
         * @param {Ember.Object} item the item to remove
         */
        remove: function(item) {
            this.removeObject(item);
            item.removeObserver('orderBy', this, 'itemSortValueDidChange');
        },

        /**
         * Clears the contents in place so you can reuse the content if desired.
         */
        purge: function() {
            // Implementation note: this is called 'purge' instead of 'clear'
            // since MutableArray will remove values in a non-sorted order
            // which will crash.
            for (var offset = this.get('length') - 1 ; offset >= 0 ; offset--) {
                var lastItem = this.get('content')[offset];
                this.remove(lastItem);
            }
        },

        /**
         * @private
         *
         * Binary search implementation that finds the index
         * where a item should be inserted.
         */
        binarySearch: function(value, low, high) {
            var mid, midValue;

            if (low === high) {
                return low;
            }

            mid = low + Math.floor((high - low) / 2);
            midValue = this.objectAt(mid).get('orderBy');

            if (value > midValue) {
                return this.binarySearch(value, mid+1, high);
            } else if (value < midValue) {
                return this.binarySearch(value, low, mid);
            }

            return mid;
        },

        /**
         * @private
         *
         * Adjusts the sorting caused by a sort value change in an item.
         *
         * @param item suspect item has changed sort value
         */
        itemSortValueDidChange: function(item) {
            this.remove(item);
            this.add(item);
        }



    });