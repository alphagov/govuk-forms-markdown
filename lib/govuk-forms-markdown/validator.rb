# frozen_string_literal: true

require "redcarpet"
require "redcarpet/render_strip"

module GovukFormsMarkdown
  class Validator
    attr_accessor :markdown, :errors

    def initialize(markdown = "")
      @markdown = markdown
    end

    def validate_length
      markdown_without_syntax = Redcarpet::Markdown.new(Redcarpet::Render::StripDown).render(markdown).strip

      :too_long if markdown_without_syntax.length >= 5000
    end
  end
end
