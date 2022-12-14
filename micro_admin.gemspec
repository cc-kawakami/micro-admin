
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "micro_admin/version"

Gem::Specification.new do |spec|
  spec.name          = "micro_admin"
  spec.version       = MicroAdmin::VERSION
  spec.authors       = ["cc-kawakami"]
  spec.email         = ["me@moeki.dev"]

  spec.summary       = "A minimal administration dashboard parts."
  spec.description   = "A minimal administration dashboard parts."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-power_assert", "~> 1.1"
  spec.add_development_dependency "cells", "~> 4.1"
  spec.add_development_dependency "cells-erb", "~> 0.1"
  spec.add_development_dependency "activesupport", "~> 7.0"
end
