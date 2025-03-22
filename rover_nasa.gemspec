# frozen_string_literal: true

require_relative "lib/rover_nasa/version"

Gem::Specification.new do |spec|
  spec.name = "rover_nasa"
  spec.version = RoverNasa::VERSION
  spec.authors = ["oscar gil"]
  spec.email = ["mcastrorap@gmail.com"]

  spec.summary = "A simple gem to control rovers on a Martian plateau."
  spec.description = "This gem allows you to simulate the movement of rovers on a rectangular plateau on Mars, given their initial positions and a series of commands."
  spec.homepage = "https://github.com/Nagasaki231212/rover_nasa"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Nagasaki231212/rover_nasa"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
