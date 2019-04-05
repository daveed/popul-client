# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'popul/version'

Gem::Specification.new do |spec|
  spec.name          = 'popul'
  spec.version       = Popul::VERSION
  spec.authors       = ['daveed']
  spec.email         = ['david.alphen@gmail.com']

  spec.summary       = %q{Popul API}
  spec.description   = %q{A Ruby client to access the Popul API.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to http://mygemserver.com'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.11'
  spec.add_dependency 'faraday_middleware', '~> 0.11.0'
  spec.add_dependency 'multi_json', '~> 1.12'
  spec.add_dependency 'json', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.14'
  spec.add_development_dependency 'webmock', '~> 3.0'
  spec.add_development_dependency 'yard', '~> 0.9'

  spec.metadata['yard.run'] = 'yri'
end
