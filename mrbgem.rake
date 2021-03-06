require "#{MRUBY_ROOT}/lib/mruby/source"

MRuby::Gem::Specification.new('mruby-publicsuffix') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Okumura Takahiro'
  spec.summary = %q{mruby port of publicsuffix-ruby. Domain name parser based on the Public Suffix List.}
  spec.description = %q{The purpose of this mgem is mruby port of publicsuffix-ruby. PublicSuffix can parse and decompose a domain name into top level domain, domain and subdomains.}
  spec.version = '0.1.0'

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
  spec.add_test_dependency 'mruby-onig-regexp'
  spec.add_test_dependency 'mruby-eval', core: 'mruby-eval'
  # spec.add_test_dependency 'mruby-memprof', github: 'iij/mruby-memprof'
end
