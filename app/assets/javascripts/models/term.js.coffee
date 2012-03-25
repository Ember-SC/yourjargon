YJ.Term = Em.Object.extend(Em.Copyable,
    term: null
    description: null
    copyable: true

    # Normal usage: 'Ember.copy(aTerm, false)'
    copy: ->
      YJ.Term.create(
          term: this.get('term')
          description: this.get('description')
      )

    sortValue: (->
      return @get("term")
    ).property("term")

    firstLetter: (->
      return @get('term').charAt(0).toUpperCase()
    ).property('term')
)
