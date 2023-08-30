require "redcarpet"

require_relative "./govuk-forms-markdown/version"
require_relative "./govuk-forms-markdown/renderer"
require_relative "./govuk-forms-markdown/validator"

module GovukFormsMarkdown
  class Error < StandardError; end

  def self.render(markdown)
    renderer = GovukFormsMarkdown::Renderer.new({ link_attributes: { class: "govuk-link", rel: "noreferrer noopener", target: "_blank" } })
    Redcarpet::Markdown.new(renderer, no_intra_emphasis: true).render(markdown).strip
  end

  def self.validate(markdown)
    GovukFormsMarkdown::Validator.new(markdown).validate
  end
end
