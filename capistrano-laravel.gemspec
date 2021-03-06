# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-laravel'
  spec.version       = '0.0.4'
  spec.authors       = ['Small Hadron Collider']
  spec.email         = ['mark@smallhadroncollider.com']
  spec.description   = %q{Laravel support for Capistrano 3.x}
  spec.summary       = %q{Laravel support for Capistrano 3.x}
  spec.homepage      = 'https://github.com/smallhadroncollider/capistrano-laravel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.4.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.1'
end
