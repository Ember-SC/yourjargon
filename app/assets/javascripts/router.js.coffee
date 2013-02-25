YJ.Router.map ->
  @route "home",
    path: "/"
  @resource 'terms', ->
    @route "index"
  @resource 'term'
    path: 'terms/:term_id'
  , ->
    @route "new"
    @route "search"
    @route "show"
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
