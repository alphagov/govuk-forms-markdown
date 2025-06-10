# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#double_emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format double_emphasis" do
    expect(renderer.double_emphasis("very important text")).to eq "very important text"
  end

  describe "rendering errors" do
    it "does log an error for double emphasis being used" do
      renderer.double_emphasis("very important text")
      expect(renderer.errors).to eq([:used_emphasis])
    end

    context "when double_emphasis is called multiple times in a single render" do
      it "returns only 1 single warning for that one render" do
        renderer.double_emphasis("important text")
        renderer.double_emphasis("very important text")

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_emphasis])
      end
    end
  end
end
