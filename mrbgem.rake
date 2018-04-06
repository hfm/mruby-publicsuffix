require "#{MRUBY_ROOT}/lib/mruby/source"

MRuby::Gem::Specification.new('mruby-publicsuffix') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Okumura Takahiro'

  spec.add_dependency 'mruby-struct', core: 'mruby-struct'
  spec.add_dependency 'mruby-string-ext', core: 'mruby-string-ext'
  spec.add_dependency 'mruby-enum-ext', core: 'mruby-enum-ext'
  spec.add_dependency 'mruby-symbol-ext', core: 'mruby-symbol-ext'
  spec.add_dependency 'mruby-hash-ext', core: 'mruby-hash-ext'
  if MRuby::Source::MRUBY_VERSION >= '1.4.0'
    spec.add_dependency 'mruby-io', core: 'mruby-io'
  else
    spec.add_dependency 'mruby-io'
  end

  spec.test_rbfiles = Dir.glob("#{dir}/test/**/*_test.rb")
  spec.add_test_dependency 'mruby-mtest'
end
