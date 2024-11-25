# Factorial's Backend Skills Test (by Moiśes Déniz Alemán)

Welcome to my implemention of the Marcus's Bikes Shop, the backend skills test for Factorial. 

## 📝 Instructions

### Setup

As this project is based on the [Ruby on Rails](https://rubyonrails.org/) framework, here you can find the steps in order have it working.

#### Prerequisites

You most probably have all the needed libraries set in your system if you have worked with Ruby on Rails lately. Here is a list of the base you need to have:

* [Ruby](https://www.ruby-lang.org) language is installed, 3.3.4
* [Ruby on Rails](https://rubyonrails.org/) framework CLI is installed, version 7.2.2
* [Bundler](https://bundler.io/) is installed, at least version 2.5
* [RubyGems](https://rubygems.org/) is installed, at least version 3.5
* You cloned the private repository and entered in a shell console inside it

Get all the gem dependencies needed by running bundler like this:

```bash
./bin/bundle install
```

To check that the app is working you can boot the webserver like this:

```bash
./bin/dev 
```
You should see an output similar to this:

![Webserver](doc/assets/dev_server.png)

And then browse to the listening url (by default is http://127.0.0.1:3000/). If you see something like this the app is successfully setup:

![Webserver](doc/assets/server_up.png)

### Tests

The project uses [RSpec](https://rspec.info/) as testing framework. You can run the specs suite like this:

```bash
./bin/rails spec
```

Format for the output is set to [documentation](https://rspec.info/features/3-13/rspec-core/command-line/format-option/) by default in the project which prints more verbose sentences. 

## 🏗️ Solution Design

Given the specifications sent to me via email (see [PDF](doc/code_challenge_specifications.pdf)) we can extract the requisites for this project and make some assumptions in order to create the proper solution.

### Requisites


### Assumptions

### Solution

#### Language and Framework

The first choice I made was to select [Ruby](https://www.ruby-lang.org) language and leverage of the [Ruby on Rails](https://rubyonrails.org/) framework as I have more experience with.

#### Data model
#### Main user actions
#### Product page
#### Add to cart action
#### Administrative workflows
##### New product creation
##### Adding a new part choice
##### Setting prices