# frozen_string_literal: true

RSpec.describe GovukFormsMarkdown do
  it "has a version number" do
    expect(GovukFormsMarkdown::VERSION).not_to be nil
  end

  it "does not render tables" do
    markdown =
      <<~MD
        | First name   | Last name    | DOB        |
        | ------------ | ------------ | ---------- |
        | John         | Smith        | 01-04-1970 |
        | Alison       | Brown        | 02-05-1970 |
        | Adam         | Sample       | 03-06-1970 |
      MD

    expected_html = <<~HTML
      <p class="govuk-body">
        | First name   | Last name    | DOB        |
        | ------------ | ------------ | ---------- |
        | John         | Smith        | 01-04-1970 |
        | Alison       | Brown        | 02-05-1970 |
        | Adam         | Sample       | 03-06-1970 |
      </p>
    HTML

    expect_equal_ignoring_ws(render(markdown), expected_html)
  end

  it "renders H2s and GOV.UK classes" do
    expect(render("## Top heading")).to eq('<h2 class="govuk-heading-l">Top heading</h2>')
  end

  it "renders H3s with ids and GOV.UK classes" do
    expect(render("### A heading")).to eq('<h3 class="govuk-heading-m">A heading</h3>')
  end

  it "renders paragraphs with GOV.UK classes" do
    expect(render("abc")).to eq('<p class="govuk-body">abc</p>')
  end

  it "renders code without emphasis" do
    expect(render("I am a snake_cased_word")).to include("snake_cased_word")
  end

  it "renders unordered lists with GOV.UK classes" do
    input = <<~MARKDOWN
      * abc def
      * xyz
    MARKDOWN
    expected = <<~HTML
      <ul class="govuk-list govuk-list--bullet">
        <li>abc def</li>
      <li>xyz</li>

      </ul>
    HTML
    expect(render(input)).to eq(expected.strip)
  end

  it "renders ordered lists with GOV.UK classes" do
    input = <<~MARKDOWN
      1. abc def
      2. xyz
    MARKDOWN
    expected_html = <<~HTML
      <ol class="govuk-list govuk-list--number">
        <li>abc def</li>
        <li>xyz</li>
      </ol>
    HTML
    expect_equal_ignoring_ws(render(input), expected_html)
  end

  it "renders a URL in angle brackets with GOV.UK classes" do
    expect(render("<https://www.gov.uk/help>")).to eq(
      '<p class="govuk-body"><a href="https://www.gov.uk/help" class="govuk-link" rel="noreferrer noopener" target="_blank">https://www.gov.uk/help</a></p>',
    )
  end

  it "renders an email address in angle brackets with GOV.UK classes" do
    expect(render("<noreply@gov.uk>")).to eq(
      '<p class="govuk-body"><a href="mailto:noreply@gov.uk" class="govuk-link" rel="noreferrer noopener" target="_blank">noreply@gov.uk</a></p>',
    )
  end

  it "does not render hrules with GOV.UK classes" do
    expect(render("---")).to eq ""
  end

  context "when unsafe content is used it should be escaped" do
    it "renders escaped H2s and GOV.UK classes" do
      expect(render("## <script>alert('Hacked');</script>")).to eq('<h2 class="govuk-heading-l">&lt;script&gt;alert(&#39;Hacked&#39;);&lt;/script&gt;</h2>')
    end

    it "renders escaped p and GOV.UK classes" do
      input = <<~MARKDOWN
        <script>alert('Hacked');</script>

        <script>alert('Hacked');</script>

        <script>alert('Hacked');</script>
      MARKDOWN

      expected_html = <<~HTML
        <p class="govuk-body">&lt;script&gt;alert(&#39;Hacked&#39;);&lt;/script&gt;</p>
        <p class="govuk-body">&lt;script&gt;alert(&#39;Hacked&#39;);&lt;/script&gt;</p>
        <p class="govuk-body">&lt;script&gt;alert(&#39;Hacked&#39;);&lt;/script&gt;</p>
      HTML

      expect_equal_ignoring_ws(render(input), expected_html)
    end

    it "escapes html tags" do
      input = <<~MARKDOWN
        <div>My new section</div>

        <p>Let me add my own paragraph tags</p>

        <ul>
          <li>List with one item</li>
        </ul>
      MARKDOWN

      expected_html = <<~HTML
        <p class="govuk-body">&lt;div&gt;My new section&lt;/div&gt;</p>
        <p class="govuk-body">&lt;p&gt;Let me add my own paragraph tags&lt;/p&gt;</p>
        <p class="govuk-body">&lt;ul&gt;\n  &lt;li&gt;List with one item&lt;/li&gt;\n&lt;/ul&gt;</p>
      HTML

      expect_equal_ignoring_ws(render(input), expected_html)
    end
  end
end
