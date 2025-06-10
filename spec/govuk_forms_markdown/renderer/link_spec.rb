# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#link" do
  subject(:renderer) { described_class.new }

  context "when there is no title" do
    it "renders a link" do
      expect(renderer.link("https://example.com", nil, "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
    end
  end

  context "when there is a title" do
    it "renders a link" do
      expect(renderer.link("https://example.com", "Link title", "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" title=\"Link title\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
    end
  end
end
