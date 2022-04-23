# frozen_string_literal: true

require_relative "lib/earned_value_calculator/version"

Gem::Specification.new do |spec|
  spec.name = "earned_value_calculator"
  spec.version = EarnedValueCalculator::VERSION
  spec.authors = ["smapira"]
  spec.email = ["25024587+smapira@users.noreply.github.com"]

  spec.summary = "Calculate the earned value of a project"
  spec.description = "Calculate the earned value of a project"
  spec.homepage = "https://github.com/routeflags/earned_value_calculator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/routeflags/earned_value_calculator"
  spec.metadata["changelog_uri"] = "https://github.com/routeflags/earned_value_calculator"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "activemodel"
  spec.add_runtime_dependency "business_time"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rbs"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "typeprof"
end
