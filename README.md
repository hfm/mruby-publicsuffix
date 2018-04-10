# mruby-publicsuffix [![Build Status](https://travis-ci.org/hfm/mruby-publicsuffix.svg?branch=master)](https://travis-ci.org/hfm/mruby-publicsuffix)

[Public Suffix List](https://publicsuffix.org/) for mruby. The purpose of this project is mruby port of [publicsuffix-ruby](https://github.com/weppos/publicsuffix-ruby).

## Requirements

- mruby >= 1.3.0

## Installation

You can add conf.gem line to `build_config.rb`:

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'hfm/mruby-publicsuffix'
end
```

## Usage

#### NOTE

mruby-publicsuffix aims at porting from publicsuffix-ruby, but there's some differences, so it cannot provide totally the same functionality.

### PublicSuffix class methods

#### PublicSuffix.domain

`PublicSuffix.domain` extracts the domain out from a given name and returns it as String class.

```rb
PublicSuffix.domain('google.com')
# => "google.com"
```

If given a domain with subdomains, returning the domain.

```rb
PublicSuffix.domain('www.google.com')
# => "google.com"
PublicSuffix.domain('www.google.co.uk')
# => "google.co.uk"
```

This library automatically recognizes FQDN (Fully Qualified Domain Names). A FQDN is a domain name that end with a trailing dot.

```rb
PublicSuffix.domain("www.google.com.")
# => "google.com"
```

#### PublicSuffix.parse

`PublicSuffix.parse` parses a domain and returns an object of `PublicSuffix::Domain` class. This method support a domain with subdomains.

```rb
domain = PublicSuffix.parse('www.google.com')
# => #<PublicSuffix::Domain:0x7fa3bf84c9b0>
```

#### PublicSuffix.valid?

Checks whether a given domain is assigned and allowed, without actually parsing it. This method doesn't care whether domain is a domain or subdomain. The validation is performed using the default [`PublicSuffix::List`](#publicsuffix-list).

Simple validation example:

```rb
PublicSuffix.valid?("google.com")
# => true

# Explicitly forbidden, it is listed as a private domain
> PublicSuffix.valid?("blogspot.com")
# => false

# Unknown/not-listed TLD domains are valid by default
> PublicSuffix.valid?("example.tldnotlisted")
# => true
```

Strict validation (without applying the default * rule):

```ruby
> PublicSuffix.valid?("example.tldnotlisted", PublicSuffix::List.default, nil)
# => false
```

## License

under the MIT License:
- see LICENSE file
