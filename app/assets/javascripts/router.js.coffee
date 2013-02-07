YJ.Router.map ->
  @route "home",
    path: "/"
  @resource "terms", ->
    @route "index"
    @route "new"
    @route "search"
    @resource "term", ->
      @route "edit"
  @resource "user", ->
  	@route "dashboard"
  	@route "login"
  	@route "signup"
  	@route "registration"
  	@route "edit"
  	@route "logout"
  @resource "organizations", ->
  	@route "new"
  	@resource "organization", ->
  		@route "profile"
