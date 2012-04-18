# yourjargon - A Private Maintainable Glossary

This web application shows the power of Rails and [EmberJS](http://emberjs.com) to provide a powerful client side
experience.  Advanced BDD and TDD test tools such as Cucumber and Jasmine are used to drive out the functionality.

# What Does this Web Application Do?

*TODO*

# Installation

## Prerequisites

 * Mac OS X
 * **Snow Leopard** or **Lion**
 * 64 bit

## Preparation

A variety of open-source packages are required:

### Xcode

Install [Xcode](http://developer.apple.com/technologies/mac/) and the necessary SDK for development (gcc,
various tools, libraries, etc).

### rvm

Use [rvm](http://beginrescueend.com/) to keep your entire Ruby/Gem installation for this project separate from your others if you haven't already.

To install:

    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

### Install Ruby 1.9.3-p125 and the Ruby Gems

Using *rvm*:

    rvm install ruby-1.9.3-p125
    rvm use ruby-1.9.3-p125

This last step will take a few minutes.  When done:

### phantomJS

[phantomJS](http://code.google.com/p/phantomjs/) is a headless WebKit with JavaScript API.  We're going to use it as
a javascript engine for running unit tests.

To install it, follow the instructions [here](http://code.google.com/p/phantomjs/wiki/Installation).  Do the easy static installation from the zip file.

## Installation

Now, with the prep work finished, we can install the application.

### Cloning and Your Jargon Setup

    git clone git@github.com:OC-Emberjs/yourjargon.git
    cd yourjargon
    gem install bundler --no-ri --no-rdoc
    bundle install
    git checkout develop

This will cause *rvm* to ask you to confirm whether you want to use the `.rvmrc` file.  Affirm positively as many times as you need to.

    rake db:migrate

### Running Rails Tests

    rake

### Starting Rails

    rails s

### Running the Web Application

[Browse](http://localhost:3000/)

### Running the Browser Tests

#### Method 1

In your project home directory:

    bundle exec guard

Observe the test report. *NOTE: this is set up so that every time you save a javascript file,
all the client tests are run again.*

#### Method 2

[Browse](http://localhost:3000/jasmine)

This will show a **Jasmine** dashboard in which you can run tests and see results.

# Miscellaneous

## Credits

* To the [arailsdemo](http://www.arailsdemo.com/) screencasts.  They are excellent.  Thank you!
