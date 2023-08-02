# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#block_quote" do
  subject(:renderer) { described_class.new }

  it "does not format blockquote" do
    expect(renderer.block_quote("This is a quote").strip).to eq "<p class=\"govuk-body\">This is a quote</p>"
  end
end
# rubocop:enable RSpec/FilePath
