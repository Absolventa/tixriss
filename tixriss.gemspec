# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tixriss/version'

Gem::Specification.new do |spec|
  spec.name          = "tixriss"
  spec.version       = Tixriss::VERSION
  spec.authors       = ["Carsten Zimmermann"]
  spec.email         = ["cz@aegisnet.de"]
  spec.summary       = %q{Simple Ruby library and command line interface to access Sistrix' links.list API}
  spec.description   = %q{Retrieves links.list data and allows processing/transformation}
  spec.homepage      = "https://github.com/Absolventa/tixriss"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-spec-context"
  spec.add_development_dependency "minitest-implicit-subject"
end
