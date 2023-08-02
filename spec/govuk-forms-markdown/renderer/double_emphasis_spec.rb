# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#double_emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format double_emphasis" do
    expect(renderer.double_emphasis("very important text")).to eq "very important text"
  end
end
# rubocop:enable RSpec/FilePath
