# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer do
  subject(:renderer) { described_class.new }

  describe "#hrule" do
    it "does not render hrule" do
      expect(renderer.hrule).to eq nil
    end
  end
end
