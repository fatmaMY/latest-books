# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latest_books/version'

Gem::Specification.new do |spec|
  spec.name          = "latest_books"
  spec.version       = LatestBooks::VERSION
  spec.authors       = ["fatma yousef"]
  spec.email         = ["famyaltimimi@yahoo.com"]

  spec.summary       = %q{This gem returns information about the latest books.}
  spec.homepage      = "https://github.com/fatmaMY/latest-books"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "pry"
  spec.add_dependency "nokogiri"
  # spec.add_dependency "launchy"
end
