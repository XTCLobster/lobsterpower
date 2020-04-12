lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lobsterpower/version"

Gem::Specification.new do |spec|
  spec.name          = "lobsterpower"
  spec.version       = LobsterPower::VERSION
  spec.authors       = ["Christian Tietze", "Daniel van Westen"]
  spec.email         = ["christian.tietze@gmail.com"]

  spec.summary       = %q{Lobsters doing powerful things.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/XTCLobster/lobsterpower"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "app"
  spec.executables   = spec.files.grep(%r{^app/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"

  spec.add_dependency "gosu", "~> 0.15.1"
  spec.add_dependency "minigl", "~> 2.2.8"
end
