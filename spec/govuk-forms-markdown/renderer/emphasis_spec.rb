# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#emphasis" do
    it "does not format emphasis" do
      expect(renderer.emphasis("important text")).to eq "important text"
    end
  end
end
