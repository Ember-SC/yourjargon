# yourjargon - A Private Maintainable Glossary

This web application shows the power of Rails and [EmberJS](http://emberjs.com) to provide a powerful client side
experience.

# What Does this Web Application Do?

*TODO*

# Installation

## Prerequisites

Building and running this application presumes that you have already done the following:

1.  This presumes you are running:
 * Mac OS X
 * **Snow Leopard** or **Lion**
 * 64 bit

## Preparation

A number of open-source packages are required; here's how to get them:

### Xcode

Install [Xcode](http://developer.apple.com/technologies/mac/) and the necessary SDK for development (gcc,
various tools, libraries, etc).

### Qt Binary Package

Install [Qt binary package](http://qt.nokia.com/downloads/qt-for-open-source-cpp-development-on-mac-os-x). *NOTE: Download and install the first `dmg` file: http://get.qt.nokia.com/qt/source/qt-mac-opensource-4.8.0.dmg*

### rvm

Use [rvm](http://beginrescueend.com/) to keep your entire Ruby/Gem installation for this project separate from your others if you haven't already.

To install:

    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

### Install Ruby 1.9.3-p0 and the Ruby Gems

Do this section if you haven't installed Ruby version `1.9.3-p0`.

Using *rvm*:

    rvm install ruby-1.9.3-p0
    rvm use ruby-1.9.3-p0
    rvm gemset create yourjargon
    gem install bundler --no-ri --no-rdoc
    bundle install

This last step will take a few minutes.  When done:

### phantomJS

[phantomJS](http://code.google.com/p/phantomjs/) is a headless WebKit with JavaScript API.  We're going to use it as
a javascript engine for running unit tests.  The 3rd command below copies its binary to a location in your path.

    git clone git://github.com/ariya/phantomjs.git && cd phantomjs && git checkout 1.3
    qmake -spec macx-g++ && make
    cp bin/phantomjs /usr/local/bin

## Installation

Now, with the prep work finished, we can install the application.

### Cloning

    git clone git@github.com:oldfartdeveloper/yourjargon.git
    cd yourjargon

This will cause *rvm* to ask you to confirm whether you want to use the `.rvmrc` file.  Affirm positively as many times as you need to.

    rake db:migrate

### Running Rails Tests

    rake

### Starting Rails

    rails s

### Running the Web Application

[Browse](http://localhost:3000/todos)

# Miscellaneous

## Credits

* To the [arailsdemo](http://www.arailsdemo.com/) screencasts.  They are excellent.  Thank you!
