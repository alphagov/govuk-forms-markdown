# frozen_string_literal: true

module GovukFormsMarkdown
  class Renderer < ::Redcarpet::Render::Safe
    class Error < StandardError; end

    attr_reader :errors

    def initialize(options = {}, allow_headings: true)
      super options
      @allow_headings = allow_headings
      @errors = []
    end

    def header(text, header_level)
      heading_size = case header_level
                     when 2 then "m"
                     when 3 then "s"
                     end

      if @allow_headings == false
        add_to_error(:headings_not_allowed)
        paragraph(text)
      elsif heading_size.nil?
        add_to_error(:heading_levels)
        paragraph(text)
      else
        <<~HTML
          <h#{header_level} class="govuk-heading-#{heading_size}">#{text}</h#{header_level}>
        HTML
      end
    end

    def paragraph(text)
      <<~HTML
        <p class="govuk-body">#{text}</p>
      HTML
    end

    def block_quote(quote)
      add_to_error(:used_block_quote)
      paragraph(quote)
    end

    def hrule
      add_to_error(:used_hrule)
      nil
    end

    def codespan(code)
      add_to_error(:used_codespan)
      code
    end

    def emphasis(text)
      add_to_error(:used_emphasis)
      text
    end

    def double_emphasis(text)
      add_to_error(:used_emphasis)
      text
    end

    def triple_emphasis(text)
      add_to_error(:used_emphasis)
      text
    end

    def link(link, title, content)
      title_attribute = title.nil? ? "" : " title=\"#{title}\""
      %(<a href="#{link}" class="govuk-link"#{title_attribute} rel="noreferrer noopener" target="_blank">#{content} (opens in new tab)</a>)
    end

    def list(contents, list_type)
      if list_type == :unordered
        <<~HTML
          <ul class="govuk-list govuk-list--bullet">
            #{contents}
          </ul>
        HTML
      elsif list_type == :ordered
        <<~HTML
          <ol class="govuk-list govuk-list--number">
            #{contents}
          </ol>
        HTML
      else
        raise GovukFormsMarkdown::Error, "Unexpected type #{list_type.inspect}"
      end
    end

  private

    def add_to_error(error)
      symbolized_error = error.to_sym
      errors << symbolized_error unless errors.include?(symbolized_error)
    end
  end
end
