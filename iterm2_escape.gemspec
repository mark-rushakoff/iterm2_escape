# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iterm2_escape/version'

Gem::Specification.new do |spec|
  spec.name          = "iterm2_escape"
  spec.version       = Iterm2Escape::VERSION
  spec.authors       = ["Mark Rushakoff"]
  spec.email         = ["mark.rushakoff@gmail.com"]
  spec.description   = %q{A simple interface to iTerm2 proprietary escape codes.}
  spec.summary       = <<-SUMMARY
iterm2_escape provides a simple API to set:
* tab chrome color
* tab title
* window title
SUMMARY
  spec.homepage      = "https://github.com/mark-rushakoff/iterm2_escape"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
