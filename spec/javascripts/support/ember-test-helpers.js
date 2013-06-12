// ember-test-helpers.js includes
// ember-testing/test
// ember-testing/adapters
// ember-testing/helpers
// See ember.js master branch at commit f634c45cde23ff60fcc1f32676db8c37a11d573e

(function(){

var slice = [].slice,
    helpers = {},
    originalMethods = {},
    injectHelpersCallbacks = [];

/**
  @class Test
  @namespace Ember
*/
Ember.Test = {

  /**
    @public

    `registerHelper` is used to register a
    test helper that will be injected when
    `App.injectTestHelpers` is called.

    The helper method will always be called
    with the current Application as the first
    parameter.

    For example:
    ```javascript
    Ember.Test.registerHelper('boot', function(app)) {
      Ember.run(app, app.deferReadiness);
    }
    ```

    This helper can later be called without arguments
    because it will be called with `app` as the
    first parameter.

    ```javascript
      App = Ember.Application.create();
      App.injectTestHelpers();
      boot();
    ```

    Whenever you register a helper that
    performs async operations,
    make sure you `return wait();` at the
    end of the helper.

    If an async helper also needs to return a value,
    pass it to the `wait` helper as a first argument:
    `return wait(val);`

    @method registerHelper
    @param name {String}
    @param helperMethod {Function}
  */
  registerHelper: function(name, helperMethod) {
    helpers[name] = helperMethod;
  },
  /**
    @public
    @method unregisterHelper
    @param name {String}
  */
  unregisterHelper: function(name) {
    delete helpers[name];
    if (originalMethods[name]) {
      window[name] = originalMethods[name];
    }
    delete originalMethods[name];
  },

  /**
    @public

    Used to register callbacks to be fired
    whenever `App.injectTestHelpers` is called

    The callback will receive the current application
    as an argument.

    @method unregisterHelper
    @param name {String}
  */
  onInjectHelpers: function(callback) {
    injectHelpersCallbacks.push(callback);
  },

  /**
    @public

    This returns a thenable tailored
    for testing.  It catches failed
    `onSuccess` callbacks and invokes
    the `Ember.Test.adapter.exception`
    callback in the last chained then.

    This method should be returned
    by async helpers such as `wait`.

    @method promise
    @param resolver {Function}
  */
  promise: function(resolver) {
    var promise = new Ember.RSVP.Promise(resolver);
    var thenable = {
      chained: false
    };
    thenable.then = function(onSuccess, onFailure) {
      var thenPromise, nextPromise;
      thenable.chained = true;
      thenPromise = promise.then(onSuccess, onFailure);
      // this is to ensure all downstream fulfillment
      // handlers are wrapped in the error handling
      nextPromise = Ember.Test.promise(function(resolve) {
        resolve(thenPromise);
      });
      thenPromise.then(null, function(reason) {
        // ensure this is the last promise in the chain
        // if not, ignore and the exception will propagate
        // this prevents the same error from being fired multiple times
        if (!nextPromise.chained) {
          Ember.Test.adapter.exception(reason);
        }
      });
      return nextPromise;
    };
    return thenable;
  },

  /**
   @public

   Used to allow ember-testing
   to communicate with a specific
   testing framework.

   You can manually set it before calling
   `App.setupForTesting()`.

   Example:
   'Ember.Test.adapter = MyCustomAdapter.create()'

   If you do not set it, ember-testing
   will default to `Ember.Test.QUnitAdapter`.
  */
  adapter: null
};

function curry(app, fn) {
  return function() {
    var args = slice.call(arguments);
    args.unshift(app);
    return fn.apply(app, args);
  };
}

Ember.Application.reopen({
  testHelpers: {},

  setupForTesting: function() {
    this.deferReadiness();

    this.Router.reopen({
      location: 'none'
    });

   // if adapter is not manually set
    // default to QUnit
    if (!Ember.Test.adapter) {
       Ember.Test.adapter = Ember.Test.QUnitAdapter.create();
    }
  },

  injectTestHelpers: function() {
    this.testHelpers = {};
    for (var name in helpers) {
      originalMethods[name] = window[name];
      this.testHelpers[name] = window[name] = curry(this, helpers[name]);
    }

    for(var i = 0, l = injectHelpersCallbacks.length; i < l; i++) {
      injectHelpersCallbacks[i](this);
    }
  },

  removeTestHelpers: function() {
    for (var name in helpers) {
      window[name] = originalMethods[name];
      delete this.testHelpers[name];
      delete originalMethods[name];
    }
  }
});


var Test = Ember.Test;

/**
  @class Adapter
  @namespace Ember.Test
*/
Test.Adapter = Ember.Object.extend({
  /**
    @public

    This callback will be called
    whenever an async operation
    is about to start.

    Override this to call your
    framework's methods
    that handle async operations

    @method asyncStart
  */
  asyncStart: Ember.K,

  /**
    @public

    This callback will be called
    whenever an async operation
    has completed.

    @method asyncEnd
  */
  asyncEnd: Ember.K,

  /**
   @public

    Override this method with your
    testing framework's false assertion
    This function is called whenever
    an exception occurs causing the testing
    promise to fail.

    QUnit example:

    ```javascript
    exception: function(error) {
      ok(false, error);
    }
    ```

    @method exception
    @param reason {String}
  */
  exception: function(error) {
    setTimeout(function() {
      throw error;
    });
  }
});

/**
  @class QUnitAdapter
  @namespace Ember.Test
*/
Test.QUnitAdapter = Test.Adapter.extend({
  asyncStart: function() {
    stop();
  },
  asyncEnd: function() {
    start();
  },
  exception: function(error) {
    ok(false, error);
  }
});


var get = Ember.get,
    helper = Ember.Test.registerHelper,
    pendingAjaxRequests = 0,
    countAsync = 0;


Ember.Test.onInjectHelpers(function() {
  Ember.$(document).ajaxStart(function() {
    pendingAjaxRequests++;
  });

  Ember.$(document).ajaxStop(function() {
    pendingAjaxRequests--;
  });
});


function visit(app, url) {
  app.__container__.lookup('router:main').location.setURL(url);
  Ember.run(app, app.handleURL, url);
  return wait(app);
}

function click(app, selector, context) {
  var $el = find(app, selector, context);
  Ember.run(function() {
    $el.click();
  });
  return wait(app);
}

function fillIn(app, selector, context, text) {
  var $el;
  if (typeof text === 'undefined') {
    text = context;
    context = null;
  }
  $el = find(app, selector, context);
  Ember.run(function() {
    $el.val(text).change();
  });
  return wait(app);
}

function find(app, selector, context) {
  var $el;
  context = context || get(app, 'rootElement');
  $el = app.$(selector, context);
  if ($el.length === 0) {
    throw("Element " + selector + " not found.");
  }
  return $el;
}

function wait(app, value) {
  var promise;

  promise = Ember.Test.promise(function(resolve) {
    if (++countAsync === 1) {
      Ember.Test.adapter.asyncStart();
    }
    var watcher = setInterval(function() {
      var routerIsLoading = app.__container__.lookup('router:main').router.isLoading;
      if (routerIsLoading) { return; }
      if (pendingAjaxRequests) { return; }
      if (Ember.run.hasScheduledTimers() || Ember.run.currentRunLoop) { return; }
      clearInterval(watcher);
      if (--countAsync === 0) {
        Ember.Test.adapter.asyncEnd();
      }
      Ember.run(function() {
        resolve(value);
      });
    }, 10);
  });

  return buildChainObject(app, promise);
}

/**
 Builds an object that contains
 all helper methods. This object will be
 returned by helpers and then-promises.

 This allows us to chain helpers:

 ```javascript
  visit('posts/new')
  .click('.add-btn')
  .fillIn('.title', 'Post')
  .click('.submit')
  .then(function() {
    equal('.post-title', 'Post');
  })
  .visit('comments')
  .then(function() {
    equal(find('.comments'),length, 0);
  });
 ```
*/
function buildChainObject(app, promise) {
  var helperName, obj = {};
  for(helperName in app.testHelpers) {
    obj[helperName] = chain(app, promise, app.testHelpers[helperName]);
  }
  obj.then = function(fn) {
    var thenPromise = promise.then(fn);
    return buildChainObject(app, thenPromise);
  };
  return obj;
}

function chain(app, promise, fn) {
  return function() {
    var args = arguments, chainedPromise;
    chainedPromise = promise.then(function() {
      return fn.apply(null, args);
    });
    return buildChainObject(app, chainedPromise);
  };
}

// expose these methods as test helpers
helper('visit', visit);
helper('click', click);
helper('fillIn', fillIn);
helper('find', find);
helper('wait', wait);

}());

