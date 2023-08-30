# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format emphasis" do
    expect(renderer.emphasis("important text")).to eq "important text"
  end

  describe "rendering errors" do
    it "does log an error for emphasis being used" do
      renderer.emphasis("important text")
      expect(renderer.errors).to eq([:used_emphasis])
    end

    context "when emphasis is called multiple times in a single render" do
      it "returns only 1 single warning for that one render" do
        renderer.emphasis("important text")
        renderer.emphasis("very important text")

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_emphasis])
      end
    end

    context "when emphasis, double_emphasis and triple is called in the single render" do
      it "returns only 1 single warning for that one render" do
        renderer.emphasis("important text")
        renderer.double_emphasis("very important text")
        renderer.triple_emphasis("extremely important text")

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_emphasis])
      end
    end
  end
end
# rubocop:enable RSpec/FilePath
