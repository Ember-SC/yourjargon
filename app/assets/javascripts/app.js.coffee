exports = this
exports.YJ = Em.Application.create()

YJ.Term = Em.Object.extend(
    term: null
    description: null
)

YJ.termsController = Em.ArrayProxy.create(content: [])

YJ.alphabetController = Em.ArrayProxy.create(
    content: []

    populate: ->
      this.populateRange('A', 26)
      this.populateRange('0', 10)

    populateRange: (startChar, count) ->
      i = startChar.charCodeAt()
      j = i + count
      while i < j
        this.pushObject(String.fromCharCode(i))
        i++

)

YJ.submitTerm = (term) ->
  this.termsController.pushObject(term)

