YJ.Router.map ->
  @route "home",
    path: "/"
  @resource 'terms', ->
    @route "index"
    @route "search",
      path: '/search/:search_term'
    @resource 'term', ->
      path: '/:term_id'
    , ->
      @route "new"
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
