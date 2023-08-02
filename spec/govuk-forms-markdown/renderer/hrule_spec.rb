# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GovukFormsMarkdown::Renderer, "#hrule" do
  subject(:renderer) { described_class.new }

  it "does not render hrule" do
    expect(renderer.hrule).to eq nil
  end
end
# rubocop:enable RSpec/FilePath
