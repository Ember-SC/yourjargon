###
  @class

  Shows the list of selected terms
###
YJ.ListTermsView = Em.View.extend(
    templateName: 'terms/list'

    # Binds the filtered output of the termsController to here so that
    # the selected list of terms is displayed
    terms: null
)
