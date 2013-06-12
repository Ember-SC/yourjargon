Ember.Test.adapter = Ember.Test.MochaAdapter.create();
Ember.testing = true
mocha.setup('bdd')
window.expect = chai.expect

document.write('<div id="test-YJ-container"><div id="ember-testing"></div></div>')

YJ.rootElement = '#ember-testing'
YJ.store = DS.Store.create(
  revision: 12
  adapter: DS.FixtureAdapter.create()
)

# setupForTesting(): Defers readiness and sets router location to none;
YJ.setupForTesting()

# injectTestHelpers() Adds:
# window.visit
# window.click
# window.fillIn
# window.find
YJ.injectTestHelpers()

