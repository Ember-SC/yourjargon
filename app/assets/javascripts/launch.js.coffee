# This file contains actions to be performed after all the
# your jargon coffeescript code is required.

# This will come out before release:
YJ.termsController.loadTermsForTesting()

# Wait for everything to load, then start
Ember.$ ->
  YJ.stateManager.goToState('mainState')
