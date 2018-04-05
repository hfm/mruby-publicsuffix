require "#{MRUBY_ROOT}/lib/mruby/source"

MRuby::Gem::Specification.new('mruby-publicsuffix') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Okumura Takahiro'

  spec.add_dependency 'mruby-struct', core: 'mruby-struct'
  if MRuby::Source::MRUBY_VERSION >= '1.4.0'
    spec.add_dependency 'mruby-io', core: 'mruby-io'
  else
    spec.add_dependency 'mruby-io'
  end
end
