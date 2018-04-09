# mruby-publicsuffix   [![Build Status](https://travis-ci.org/hfm/mruby-publicsuffix.svg?branch=master)](https://travis-ci.org/hfm/mruby-publicsuffix)

[Public Suffix List](https://publicsuffix.org/) for mruby. The purpose of this project is mruby port of [publicsuffix-ruby](https://github.com/weppos/publicsuffix-ruby).

PublicSuffix class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'hfm/mruby-publicsuffix'
end
```
## example
```ruby
p PublicSuffix.hi
#=> "hi!!"
t = PublicSuffix.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
