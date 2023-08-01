# frozen_string_literal: true

module GovukFormsMarkdown
  class Renderer
    class Error < StandardError; end
    # Your code goes here...

    def header(text, header_level)
      heading_size = case header_level
                     when 2 then "l"
                     when 3 then "m"
                     end

      if heading_size.nil?
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
      paragraph(quote)
    end

    def hrule
      nil
    end

    def emphasis(text)
      text
    end

    def double_emphasis(text)
      text
    end

    def triple_emphasis(text)
      text
    end
  end
end
