# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#triple_emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format triple_emphasis" do
    expect(renderer.triple_emphasis("extremely important text")).to eq "extremely important text"
  end

  describe "rendering errors" do
    it "does log an error for tripe emphasis being used" do
      renderer.triple_emphasis("extremely important text")
      expect(renderer.errors).to eq([:used_emphasis])
    end

    context "when triple_emphasis is called multiple times in a single render" do
      it "returns only 1 single warning for that one render" do
        renderer.triple_emphasis("important text")
        renderer.triple_emphasis("very important text")

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_emphasis])
      end
    end
  end
end
