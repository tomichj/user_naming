$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'user_naming/version'

Gem::Specification.new do |spec|
  spec.name          = 'user_naming'
  spec.version       = UserNaming::VERSION
  spec.authors       = ['Justin Tomich']
  spec.email         = ['justin@tomich.org']
  spec.homepage      = 'http://github.com/tomichj/user_naming'
  spec.summary       = 'A rails gem to provide naming methods for user models'
  spec.description   = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.test_files = `git ls-files -- {spec}/*`.split("\n")

  spec.require_paths = ['lib']
  spec.extra_rdoc_files = %w[LICENSE.txt README.md CODE_OF_CONDUCT.md]
  spec.rdoc_options = ['--charset=UTF-8']

  spec.add_dependency 'rails', '>= 5.0', '< 5.2'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
