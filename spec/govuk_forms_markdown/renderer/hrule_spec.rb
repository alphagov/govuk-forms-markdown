# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown::Renderer, "#hrule" do
  subject(:renderer) { described_class.new }

  it "does not render hrule" do
    expect(renderer.hrule).to be_nil
  end

  describe "rendering errors" do
    it "does log an error for horizontal being used" do
      renderer.hrule
      expect(renderer.errors).to eq([:used_hrule])
    end

    context "when hrule is called multiple times in a single render" do
      it "returns only 1 single warning for that one render" do
        renderer.hrule
        renderer.hrule

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_hrule])
      end
    end
  end
end
