# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#header" do
  subject(:renderer) { described_class.new(allow_headings:) }

  let(:allow_headings) { true }

  non_supported_heading_levels = [1, 4, 5, 6]
  supported_heading_levels = [2, 3]
  all_heading_levels = non_supported_heading_levels + supported_heading_levels

  context "when using non-supported heading levels" do
    non_supported_heading_levels.each do |level|
      it "does not format heading level #{level}" do
        expect(renderer.header("Heading level #{level}", level).strip).to eq "<p class=\"govuk-body\">Heading level #{level}</p>"
      end
    end
  end

  context "when using supported heading levels" do
    supported_heading_levels.each do |level|
      it "does format heading level #{level}" do
        heading_size = level == 2 ? "m" : "s"
        expect(renderer.header("Heading level #{level}", level).strip).to eq "<h#{level} class=\"govuk-heading-#{heading_size}\">Heading level #{level}</h#{level}>"
      end
    end
  end

  describe "rendering errors" do
    supported_heading_levels.each do |level|
      it "does not log a warning for heading level #{level}" do
        renderer.header("Heading level #{level}", level)
        expect(renderer.errors).to be_empty
      end
    end

    non_supported_heading_levels.each do |level|
      it "does log a warning for heading level #{level}" do
        renderer.header("Heading level #{level}", level)
        expect(renderer.errors).to eq([:heading_levels])
      end
    end

    context "when header is called multiple times in a single render" do
      it "returns only 1 single warning for that one render" do
        non_supported_heading_levels.each do |level|
          renderer.header("Heading level #{level}", level)
        end

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:heading_levels])
      end
    end

    context "when headings are not allowed" do
      let(:allow_headings) { false }

      all_heading_levels.each do |level|
        it "logs a warning for heading level #{level}" do
          renderer.header("Heading level #{level}", level)
          expect(renderer.errors).to eq([:headings_not_allowed])
        end
      end

      context "when header is called multiple times in a single render" do
        it "returns only 1 single warning for that one render" do
          all_heading_levels.each do |level|
            renderer.header("Heading level #{level}", level)
          end

          expect(renderer.errors.length).to eq 1
          expect(renderer.errors).to eq([:headings_not_allowed])
        end
      end
    end
  end
end
