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

This is typically used in `Rails` applications so a rails-like folder structure is assumed when running the generator.

To enable the default New Leaders conventions, run the following command:

```
$ thincloud-capify
```

If you are running this from the provided Rails generator, run:

```
$ rails g thincloud:deployment
```

This generator will do the following:

* Add `Capfile` at the root of your project
* Add `config/deploy.rb` for application-level deployment settings
* Add `config/deploy/staging.rb` and `config/deploy/production.rb` for stage-level deployment settings.
* Add the `lib/recipes` directory to store project specific recipes.
* Set up `foreman`

### Configuration

All conventional settings are contained in the gem recipes and are loaded into the `Capistrano` configuration during startup.

`thincloud-deployment` follows the `Capistrano` multistage deployment strategy. As you can see in the generator description above, we create an application `deploy.rb` as well as individual stage files (`staging.rb`, `production.rb`).

Any of the tasks or settings can be overriden in these files.

#### Adding stages

Just add a new `Ruby` file under `config/deploy`. To add a `demo` stage you would create `config/deploy/demo.rb`.

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
