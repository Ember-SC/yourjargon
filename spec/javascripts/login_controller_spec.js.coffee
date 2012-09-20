describe "Login controller", ->
  beforeEach ->
    @lc = YJ.LoginController.create()
    @email = "user@example.com"
    @password = "password"

  it "ability to set email in order to login", ->
    expect(@lc.get('email')).toBeDefined

  it "has the ability to set password in order to login", ->
    expect(@lc.get('password')).toBeDefined

  describe "asks for a session from the server", ->
    @requestUrl = "/sessions"
    @success = jasmine.createSpy("onSuccess")
    @sessionResponse = JSON.parse('{"user":{"id":1,"email":"user@example.com","name":"Example User","memberships":[]},"api_key":"sdfsdfasdfasdfasdfasdf"}')

    beforeEach ->
      jQuery.ajax(
        url: @requestUrl,
        data: "data",
        type: "POST",
        success: @success
      )

    it "should be successful", ->
      @lc.set('email', @email)
      @lc.set('password', @password)
      jasmine.Ajax.stubRequest("POST", @requestUrl).andReturn(body: @sessionResponse)
      @lc.authenticate()
      expect(jasmine.Ajax.getRequest("POST", @requestUrl)).toHaveBeenRequested()
#      expect(success).toHaveBeenCalled()
#      expect(success.mostRecentCall.args[0]).toEqual(@sesionResponse)