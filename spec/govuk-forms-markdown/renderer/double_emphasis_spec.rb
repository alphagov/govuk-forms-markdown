# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#double_emphasis" do
    it "does not format double_emphasis" do
      expect(renderer.double_emphasis("very important text")).to eq "very important text"
    end
  end
end
