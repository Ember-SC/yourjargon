# Yourjargon [![Build Status](https://secure.travis-ci.org/OC-Emberjs/yourjargon.png?branch=develop)](https://travis-ci.org/OC-Emberjs/yourjargon)

This web application shows the power of Rails and [EmberJS](http://emberjs.com) to provide a powerful client side experience.  The front end is done completely in ember, including url routing.  Rails handles the asset compilation and serving up data to the ember app via a json api.  Advanced BDD and TDD test tools such as (future) Cucumber and (presently) Jasmine are used to drive out the functionality.

# What Does this Web Application Do?

Yourjargon provides the ability to create a private dictionary for an organization to store their own "jargon" into.  Check out our applications seed data for some great examples pulled from a stackoverflow thread on programming jargon:  http://www.codinghorror.com/blog/2012/07/new-programming-jargon.html.
	
In addition, it shows off the features of EmberJS for a small application that developers learning EmberJS can easily digest:

 * Bindings
 * Observers
 * Computed Properties
 * Dynamic filtering & sorting in an ember array controller
 * Use of Ember-Data's RESTAdapter
 * Rails 3.2 application w/ active-model-serializer gem in coordination w/ ember-data
 * Jasmine test suite
 * Use of Twitter Bootstrap

# Installation

See the wiki to get your machine setup:

 * https://github.com/OC-Emberjs/yourjargon/wiki/Installation-&-Preparation

## Prerequisites

 * Ruby 1.9.x
 * Phantomjs (for running tests)

### Setup

  - git clone git@github.com:OC-Emberjs/yourjargon.git
  - cd yourjargon
  - bundle install
  - rake db:migrate

### Running Rails Tests

    rake

### Starting Rails

    rails s

### Running the Web Application

Go to your browser at localhost:3000:
[Browse](http://localhost:3000/)

# Testing

## Running the Tests

_NOTE: Tests are not running at the moment; we're in the process of converting them
from Jasmine to Konacha/QUnit._

### Method 1

In console at your project home directory:

    rake konacha:serve

Then browse [localhost:3500](localhost:3500)

Observe the test report. *NOTE: this is set up so that every time you save a javascript file,
all the client tests are run again.*

### Method 2

1. Launch server
2. [Browse http://localhost:5000](http://localhost:5000/jasmine)

This will show a **Jasmine** dashboard in which you can run tests and see results.

# Contributing

We'd love contributions.  Submit a pull request by following the instructions below!

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

