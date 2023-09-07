# frozen_string_literal: true

require "redcarpet"
require "redcarpet/render_strip"

require_relative "./renderer"

module GovukFormsMarkdown
  class Validator
    attr_accessor :markdown, :errors

    def initialize(markdown = "")
      @markdown = markdown
    end

    def validate
      { errors: [validate_length, validate_tags].compact.flatten }
    end

    def validate_length
      markdown_without_syntax = Redcarpet::Markdown.new(Redcarpet::Render::StripDown).render(markdown).strip

      :too_long if markdown_without_syntax.length >= 5000
    end

    def validate_tags
      return nil if markdown.nil? || markdown.empty?

      renderer = GovukFormsMarkdown::Renderer.new({ link_attributes: { class: "govuk-link", rel: "noreferrer noopener", target: "_blank" } })
      Redcarpet::Markdown.new(renderer, no_intra_emphasis: true, disable_indented_code_blocks: true).render(markdown)
      renderer.errors if renderer.errors.any?
    end
  end
end
