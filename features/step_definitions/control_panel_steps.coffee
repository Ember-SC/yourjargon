{strictEqual} = require 'assert'

stepDefinitions = () ->  
  @World = require('../support/World').World
  @buster = require('buster')
  @sinon = require('../../spec/javascripts/support/sinon')

  @Given /^the sign is unlit$/, (callback) ->
    @controlPanel.deactivateSign()
    callback()    

  @When /^I press the button$/, (callback) ->
    @controlPanel.pressButton()
    callback()

  @Then /^the sign should light up with$/, (expected, callback) ->
    strictEqual @controlPanel.signMessage(), expected
    callback()   

  # step definitions for user_signs_up
  @Given /^that I am not a registered user$/, (callback) ->
    @sinon.stub($, 'ajax').returns(false)

    assert.equal(YJ.User.exists?('email@example.com'), false)
    $.ajax.restore()
    callback()

  @When /^I submit my user id, email, password$/, (callback) ->
    @sinon.stub($, 'ajax')

    # express the regexp above with the code you wish you had
    callback.pending()

  @Then /^I am a registered user$/, (callback) ->
    
    # express the regexp above with the code you wish you had
    callback.pending() 

module.exports = stepDefinitions