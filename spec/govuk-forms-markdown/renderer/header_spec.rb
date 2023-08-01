# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#header" do
    let(:supported_heading_levels) { [2, 3] }

    context "when using non-supported heading levels" do
      non_supported_heading_levels = [1, 4, 5, 6]
      non_supported_heading_levels.each do |level|
        it "does not format heading level #{level}" do
          expect(renderer.header("Heading level #{level}", level).strip).to eq "<p class=\"govuk-body\">Heading level #{level}</p>"
        end
      end
    end

    context "when using supported heading levels" do
      supported_heading_levels = [2, 3]
      supported_heading_levels.each do |level|
        it "does format heading level #{level}" do
          heading_size = level == 2 ? "l" : "m"
          expect(renderer.header("Heading level #{level}", level).strip).to eq "<h#{level} class=\"govuk-heading-#{heading_size}\">Heading level #{level}</h#{level}>"
        end
      end
    end
  end
end
