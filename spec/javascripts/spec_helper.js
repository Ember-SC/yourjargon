// Teabag includes some support files, but you can use anything from your own support path too.
//
// Deferring execution
// If you're using CommonJS, RequireJS or some other asynchronous library you can defer execution. Call Teabag.execute()
// after everything has been loaded. Simple example of a timeout:
//
// Teabag.defer = true
// setTimeout(Teabag.execute, 1000)
//
// Matching files
// By default Teabag will look for files that match _spec.{js,js.coffee,.coffee}. Add a filename_spec.js file in your
// spec path and it'll be included in the default suite automatically. If you want to customize suites, check out the
// configuration in config/initializers/teabag.rb
//
// Manifest
// If you'd rather require your spec files manually (to control order for instance) you can disable the suite matcher in
// the configuration and use this file as a manifest.
//
// For more information: http://github.com/modeset/teabag
//
// You can require javascript files here. A good place to start is by requiring your application.js.


//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require handlebars
//= require ember
//= require ember-data
//= require support/jquery.cookie
//= require app
//= require app_config
//= require router

//= require support/chai
//= require support/chai-jquery
//= require support/sinon
//= require support/ember-test-helpers
//= require support/adapter
//= require support/setup
//= require support/test_helper

