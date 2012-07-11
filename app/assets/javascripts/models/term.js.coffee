###
  @class

  The object holding the information about a term.
  A term can be copied and be modified
###
YJ.Term = DS.Model.extend(
    ###
      The term acronym, word, or phrase to look up
    ###
    name: DS.attr('string')

    ###
      The definition for the term
    ###
    description: DS.attr('string')

    ###
      Returns the first letter for use by the alphabet filter
    ###
    firstLetter: (->
      if @get('name') == undefined || @get('name') == null
        ""
      else
        @get('name').charAt(0).toUpperCase()
    ).property('name')
)
