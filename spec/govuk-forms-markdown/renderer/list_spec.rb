# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#list" do
  subject(:renderer) { described_class.new }

  context "when displaying an unordered list" do
    it "styles the ul like GOV.UK Design System" do
      contents = "A list of values"
      expected_html = <<~HTML
        <ul class="govuk-list govuk-list--bullet">
          #{contents}
        </ul>
      HTML

      expect(renderer.list(contents, :unordered)).to eq expected_html
    end
  end

  context "when displaying an ordered list" do
    it "styles the ul like GOV.UK Design System" do
      contents = "A list of values"
      expected_html = <<~HTML
        <ol class="govuk-list govuk-list--number">
          #{contents}
        </ol>
      HTML

      expect(renderer.list(contents, :ordered)).to eq expected_html
    end
  end

  context "when displaying an unsupported list" do
    it "raises an error" do
      expect { renderer.list("My list of items", :not_supported_type) }.to raise_error(GovukFormsMarkdown::Error, "Unexpected type :not_supported_type")
    end
  end
end
# rubocop:enable RSpec/FilePath
