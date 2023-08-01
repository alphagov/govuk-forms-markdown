# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#paragraph" do
    it "renders a paragraph" do
      expect(renderer.paragraph("This is some paragraph text").strip).to eq "<p class=\"govuk-body\">This is some paragraph text</p>"
    end
  end
end
