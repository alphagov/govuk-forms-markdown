# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#paragraph" do
  subject(:renderer) { described_class.new }

  it "renders a paragraph" do
    expect(renderer.paragraph("This is some paragraph text").strip).to eq "<p class=\"govuk-body\">This is some paragraph text</p>"
  end
end
# rubocop:enable RSpec/FilePath
