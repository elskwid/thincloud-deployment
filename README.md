# Thincloud::Deployment

Opinionated framework dependencies, configuration, and recipes for Capistrano-based deployments.

[New Leaders](https://newleaders.com) uses this gem to manage the following dependencies:

* [capistrano](https://github.com/capistrano/capistrano)
* [capistrano-fast_remote_cache](https://github.com/newleaders/capistrano-fast_remote_cache)
* [flowdock](https://github.com/flowdock/flowdock-api)
* [grit](https://github.com/mojombo/grit)
* [rvm-capistrano](https://github.com/wayneeseguin/rvm-capistrano)

## Requirements

This gem has been test against the following Ruby versions:

* 1.9.3

## Installation

Add this line to your application's Gemfile:

    gem 'thincloud-deployment'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thincloud-deployment

## Usage

This gem manages the deployment framework dependencies for you, provides a default set of `capistrano` recipes, and provides a `Thor` generator to bootstrap application deployment.

To

This is typically used in `Rails` applications so a rails-like folder structure is assumed when running the generator.


## Contributing

1. [Fork it](https://github.com/newleaders/thincloud-deployment/fork_select)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. [Create a Pull Request](https://github.com/newleaders/thincloud-deployment/pull/new)


## License

* Freely distributable and licensed under the [MIT license](http://newleaders.mit-license.org/2013/license.html).
* Copyright (c) 2013 New Leaders ([opensource@newleaders.com](opensource@newleaders.com))
* [https://newleaders.com](https://newleaders.com)
