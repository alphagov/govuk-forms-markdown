# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#link" do
  subject(:renderer) { described_class.new }

  context "when there is no title" do
    context "when no locale is supplied" do
      it "renders a link with English new tab text" do
        expect(renderer.link("https://example.com", nil, "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
      end
    end

    context "when locale \"en\" is supplied" do
      subject(:renderer) { described_class.new(locale: "en") }

      it "renders a link with English new tab text" do
        expect(renderer.link("https://example.com", nil, "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
      end
    end

    context "when locale \"cy\" is supplied" do
      subject(:renderer) { described_class.new(locale: "cy") }

      it "renders a link with Welsh new tab text" do
        expect(renderer.link("https://example.com", nil, "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (agor mewn tab newydd)</a>"
      end
    end
  end

  context "when there is a title" do
    context "when no locale is supplied" do
      it "renders a link with English new tab text" do
        expect(renderer.link("https://example.com", "Link title", "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" title=\"Link title\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
      end
    end

    context "when locale \"en\" is supplied" do
      subject(:renderer) { described_class.new(locale: "en") }

      it "renders a link with English new tab text" do
        expect(renderer.link("https://example.com", "Link title", "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" title=\"Link title\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (opens in new tab)</a>"
      end
    end

    context "when locale \"cy\" is supplied" do
      subject(:renderer) { described_class.new(locale: "cy") }

      it "renders a link with Welsh new tab text" do
        expect(renderer.link("https://example.com", "Link title", "Link content").strip).to eq "<a href=\"https://example.com\" class=\"govuk-link\" title=\"Link title\" rel=\"noreferrer noopener\" target=\"_blank\">Link content (agor mewn tab newydd)</a>"
      end
    end
  end
end
