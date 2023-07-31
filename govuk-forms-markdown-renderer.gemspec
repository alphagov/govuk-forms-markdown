# frozen_string_literal: true

require_relative "lib/govuk/forms/markdown/renderer/version"

Gem::Specification.new do |spec|
  spec.name = "govuk-forms-markdown-renderer"
  spec.version = Govuk::Forms::Markdown::Renderer::VERSION
  spec.authors = ["Alistair Laing"]
  spec.email = ["aliuk2012@users.noreply.github.com "]

  spec.summary = "Custom Markdown renderer for the GOV.UK Forms apps"
  spec.description = "This gem renders the limited subset of Markdown syntax supported by GOV.UK Forms."
  spec.homepage = "https://github.com/alphagov/govuk-forms-markdown-renderer"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alphagov/govuk-forms-markdown-renderer"
  spec.metadata["changelog_uri"] = "https://github.com/alphagov/govuk-forms-markdown-renderer/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-govuk"

  spec.add_dependency "redcarpet", "~> 3.6"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
