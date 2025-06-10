# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Validator do
  let(:validator) { described_class.new(markdown, allow_headings:) }
  let(:allow_headings) { true }

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

      context "when headings are disallowed" do
        let(:allow_headings) { false }
        let(:markdown) { "## A level-2 heading" }

        it "returns all errors" do
          expect(validator.validate_tags).to eq([:unsupported_tags_used])
        end
      end
    end
  end

  describe "#validate" do
    let(:markdown) { "# Some markdown text" }

    context "when validate methods return nil" do
      before do
        allow(validator).to receive_messages(validate_length: nil, validate_tags: nil)
      end

      it "removes any nil in the error array" do
        expect(validator.validate).to eq({ errors: [] })
      end
    end

    context "when validate methods return arrays" do
      before do
        allow(validator).to receive_messages(validate_length: %i[one two], validate_tags: %i[three four])
      end

      it "flattens array values" do
        expect(validator.validate).to eq({ errors: %i[one two three four] })
      end
    end
  end
end
