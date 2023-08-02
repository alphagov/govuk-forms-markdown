# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#emphasis" do
  subject(:renderer) { described_class.new }

  it "does not format emphasis" do
    expect(renderer.emphasis("important text")).to eq "important text"
  end
end
# rubocop:enable RSpec/FilePath
