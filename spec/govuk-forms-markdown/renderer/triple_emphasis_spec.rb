# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#triple_emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format triple_emphasis" do
    expect(renderer.triple_emphasis("extremely important text")).to eq "extremely important text"
  end
end
# rubocop:enable RSpec/FilePath
