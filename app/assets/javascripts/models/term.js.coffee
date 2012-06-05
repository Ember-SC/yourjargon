###
  @class

  The object holding the information about a term.
  A term can be copied and be modified
###
YJ.Term = DS.Model.extend(Em.Copyable,
    ###
      The term acronym, word, or phrase to look up
    ###
    name: DS.attr('string')

    ###
      The definition for the term
    ###
    description: DS.attr('string')

    ###
      Indicates that Ember can make copies of this object
    ###
    copyable: true

    # Normal usage: 'Ember.copy(aTerm, false)'
    copy: ->
      YJ.store.createRecord(YJ.Term,
          {term: this.get('name')
          description: this.get('description')}
      )

    ###
      Returns truthy if the term has content else returns falsy
    ###
    hasContent: (->
      myTerm = @get("name")
      return myTerm != null and myTerm.length > 0
    ).property("name")

    ###
      When sorting, sort by the term
    ###
    orderBy: (->
      return @get("name")
    ).property("name")

    ###
      Returns the first letter for use by the alphabet filter
    ###
    firstLetter: (->
      return @get('name').charAt(0).toUpperCase()
    ).property('name')
)
