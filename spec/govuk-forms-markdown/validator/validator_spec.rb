# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Validator do
  subject(:validator) { described_class.new(markdown) }

  describe "#validate_length" do
    context "when markdown is empty string" do
      let(:markdown) { "" }

      it "returns nil" do
        expect(validator.validate_length).to be_nil
      end
    end

    context "when markdown more than 5k characters but once syntax stripped is 4960 characters" do
      let(:markdown_with_5890_chars) { "# Heading level 1 \n" * 310 }
      let(:markdown) { markdown_with_5890_chars }

      it "returns nil" do
        expect(validator.validate_length).to be_nil
      end
    end

    context "when markdown eq 5k characters" do
      let(:markdown) { "a" * 5000 }

      it "returns :too_long symbol" do
        expect(validator.validate_length).to eq(:too_long)
      end
    end

    context "when markdown more than 5k characters but once syntax stripped is 5120 characters" do
      let(:markdown_with_6080_chars) { "# Heading level 1 \n" * 320 }
      let(:markdown) { markdown_with_6080_chars }

      it "returns :too_long symbol" do
        expect(validator.validate_length).to eq(:too_long)
      end
    end
  end

  describe "#validate_tags" do
    context "when markdown is empty string" do
      let(:markdown) { "" }

      it "returns nil" do
        expect(validator.validate_tags).to be_nil
      end
    end

    context "when markdown is using supported tags" do
      let(:markdown) { "## Supported heading levels" }

      before do
        # Stub out the GovukFormsMarkdown::Renderer.new and its methods
        renderer_double = instance_double(GovukFormsMarkdown::Renderer, errors: [])
        allow(GovukFormsMarkdown::Renderer).to receive(:new).and_return(renderer_double)

        # Stub out Redcarpet::Markdown.new to return a double
        markdown_double = instance_double(Redcarpet::Markdown, render: nil)
        allow(Redcarpet::Markdown).to receive(:new).and_return(markdown_double)
      end

      it "returns nil" do
        expect(validator.validate_tags).to be_nil
      end
    end

    context "when markdown is using unsupported tags" do
      let(:markdown) { "# Invalid [markdown]" }

      before do
        # Stub out the GovukFormsMarkdown::Renderer.new and its methods
        renderer_double = instance_double(GovukFormsMarkdown::Renderer, errors: [:unsupported_tags_used])
        allow(GovukFormsMarkdown::Renderer).to receive(:new).and_return(renderer_double)

        # Stub out Redcarpet::Markdown.new to return a double
        markdown_double = instance_double(Redcarpet::Markdown, render: nil)
        allow(Redcarpet::Markdown).to receive(:new).and_return(markdown_double)
      end

      it "returns all errors" do
        expect(validator.validate_tags).to eq([:unsupported_tags_used])
      end
    end
  end
end
# rubocop:enable RSpec/FilePath
