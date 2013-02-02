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
  	@route "registration"
  	@route "edit"
  @resource "organizations", ->
  	@route "new"
  	@resource "organization", ->
  		@route "profile"
