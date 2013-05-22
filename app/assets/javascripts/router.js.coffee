YJ.Router.map ->
  @route "home",
    path: "/"
  @resource 'terms', ->
    @route('new')
    @resource 'term'
      path: '/:term_id'
    , ->
      @route "edit"
  @resource "user", ->
    @route "dashboard"
    @route "login"
    @route "signup"
    @route "edit"
    @route "logout"
  @resource "organizations", ->
    @route "new"
    @resource "organization"
      path: '/:organization_id'
    , ->
      @route "profile"
  @route "notFound", path: "/*path"
