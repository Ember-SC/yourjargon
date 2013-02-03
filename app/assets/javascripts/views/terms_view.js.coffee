###
  @class

  Shows the list of selected terms
###
YJ.TermsView = Em.View.extend(
    templateName: 'terms/index'

    # Binds the filtered output of the termsController to here so that
    # the selected list of terms is displayed
    terms: null
)
