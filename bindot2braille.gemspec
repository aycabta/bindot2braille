# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bindot2braille/version'

Gem::Specification.new do |spec|
  spec.name          = "bindot2braille"
  spec.version       = Bindot2braille::VERSION
  spec.authors       = ["Code Ass"]
  spec.email         = ["aycabta@gmail.com"]

  spec.summary       = %q{Binary data to braille character}
  spec.description   = %q{Binary data 01001011 to braille character ⣌}
  spec.homepage      = "https://github.com/aycabta/bindot2braille"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
