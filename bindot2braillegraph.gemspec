# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bindot2braillegraph/version'

Gem::Specification.new do |spec|
  spec.name          = "bindot2braillegraph"
  spec.version       = BinDot2BrailleGraph::VERSION
  spec.authors       = ["Code Ass"]
  spec.email         = ["aycabta@gmail.com"]

  spec.summary       = %q{Binary data to braille graph}
  spec.description   = %q{Binary data 01001011 to braille graph ⣌}
  spec.homepage      = "https://github.com/aycabta/bindot2braillegraph"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
