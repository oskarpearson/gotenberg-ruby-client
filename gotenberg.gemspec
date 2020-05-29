
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gotenberg/version"

Gem::Specification.new do |spec|
  spec.name          = "gotenberg"
  spec.version       = Gotenberg::VERSION
  spec.authors       = ["Oskar Pearson"]
  spec.email         = ["oskar@deckle.co.uk"]

  spec.summary       = %q{Ruby implementation of the Gotenberg PDF-generation API}
  spec.description   = %q{Ruby implementation of the https://github.com/thecodingmachine/gotenberg API for PDF generation}
  spec.homepage      = "https://github.com/oskarpearson/gotenberg-ruby-client"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
