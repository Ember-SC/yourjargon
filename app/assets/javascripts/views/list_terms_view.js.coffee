###
  @class

  Shows the list of selected terms
###
YJ.ListTermsView = Em.View.extend(
    templateName: 'templates/terms/list'

    # Binds the filtered output of the termsController to here so that
    # the selected list of terms is displayed
    termsBinding: 'YJ.termsController.filtered'
)
