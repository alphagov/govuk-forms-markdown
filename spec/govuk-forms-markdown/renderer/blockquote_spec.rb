# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#block_quote" do
    it "does not format blockquote" do
      expect(renderer.block_quote("This is a quote").strip).to eq "<p class=\"govuk-body\">This is a quote</p>"
    end
  end
end
