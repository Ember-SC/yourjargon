###
  @class

  The object holding the information about a term.
  A term can be copied and be modified
###
YJ.Term = DS.Model.extend(Em.Copyable,
    ###
      Define the urls for the resource
    ###
    collectUrl: '/terms'
    resourceUrl: '/terms/%@'
    resourceName: 'term'

    ###
      The term acronym, word, or phrase to look up
    ###
    term: DS.attr('string')

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
          {term: this.get('term')
          description: this.get('description')}
      )

    ###
      When sorting, sort by the term
    ###
    sortValue: (->
      return @get("term")
    ).property("term")

    ###
      Returns the first letter for use by the alphabet filter
    ###
    firstLetter: (->
      return @get('term').charAt(0).toUpperCase()
    ).property('term')
)
