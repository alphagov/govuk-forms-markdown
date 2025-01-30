require "redcarpet"

require_relative "./govuk-forms-markdown/version"
require_relative "./govuk-forms-markdown/renderer"
require_relative "./govuk-forms-markdown/validator"

module GovukFormsMarkdown
  class Error < StandardError; end

  def self.render(markdown, allow_headings: true)
    renderer = GovukFormsMarkdown::Renderer.new({ link_attributes: { class: "govuk-link", rel: "noreferrer noopener", target: "_blank" } }, allow_headings:)
    Redcarpet::Markdown.new(renderer, no_intra_emphasis: true, disable_indented_code_blocks: true).render(markdown).strip
  end

  def self.validate(markdown, allow_headings: true)
    GovukFormsMarkdown::Validator.new(markdown, allow_headings:).validate
  end
end
