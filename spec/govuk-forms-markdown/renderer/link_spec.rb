# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#link" do
  subject(:renderer) { described_class.new }

  context "when there is no title" do
    it "renders a link" do
      expect(renderer.link("https://example.com", nil, "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\">Link content</a>"
    end
  end

  context "when there is a title" do
    it "renders a link" do
      expect(renderer.link("https://example.com", "Link title", "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" title=\"Link title\">Link content</a>"
    end
  end
end
# rubocop:enable RSpec/FilePath
