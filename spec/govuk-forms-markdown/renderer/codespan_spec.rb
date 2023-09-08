# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#codespan " do
  subject(:renderer) { described_class.new }

  it "does not format codespan" do
    expect(renderer.codespan("color: rebeccapurple;")).to eq "color: rebeccapurple;"
  end

  describe "rendering errors" do
    it "does log an error for codespan being used" do
      renderer.codespan("color: rebeccapurple;")
      expect(renderer.errors).to eq([:used_codespan])
    end

    context "when codespan is called multiple times in a single render" do
      it "returns the warning exactly once" do
        renderer.codespan("color: rebeccapurple;")
        renderer.codespan("color: rebeccapurple;")

        expect(renderer.errors.length).to eq 1
        expect(renderer.errors).to eq([:used_codespan])
      end
    end
  end
end
# rubocop:enable RSpec/FilePath
