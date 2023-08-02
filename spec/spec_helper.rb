# frozen_string_literal: true

require_relative "./../lib/govuk_forms_markdown"

def render(content)
  GovukFormsMarkdown.render(content)
end

def expect_equal_ignoring_ws(first, second)
  expect(first.lines.map(&:strip).join("")).to eq(second.lines.map(&:strip).join(""))
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
