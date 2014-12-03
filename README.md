# Tixriss [![Build Status](https://travis-ci.org/Absolventa/tixriss.svg?branch=master)](https://travis-ci.org/Absolventa/tixriss)

Tixriss is a simple Ruby library and command line interface to access Sistrix' links.list API.

## Installation

If you have a working Ruby installation you can install with:

    $ gem install tixriss

In the rare event that you would like to use the underlying
Ruby classes in your application, add this to your Gemfile:

```ruby
gem 'tixriss'
```

And then execute:

    $ bundle

## Usage

Retrieve XML data and transform output to HTML:

```shell
tixriss --key <your api key> --domain <reqested domain with link data> --file report.html
```

To get a full list of available CLI options, type:

```shell
tixriss --help
```

## Changelog

### HEAD (not yet released)

### v0.1.0
* Initial working prototype

## Contributing

1. Fork it ( https://github.com/Absolventa/tixriss/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
