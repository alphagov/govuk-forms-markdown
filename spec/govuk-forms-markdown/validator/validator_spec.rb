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
end
# rubocop:enable RSpec/FilePath
