# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#triple_emphasis" do
    it "does not format triple_emphasis" do
      expect(renderer.triple_emphasis("extremely important text")).to eq "extremely important text"
    end
  end
end
