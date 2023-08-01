# GOV.UK Forms Markdown

This gem is a custom Markdown renderer for the [GOV.UK Forms](https://www.forms.service.gov.uk) apps, designed to render the limited subset of Markdown syntax supported by GOV.UK Forms. It will render:

- Level 2 and 3 headings
- paragraphs
- links
- lists (bullet and numbered)

It will also add the required govuk-frontend classes.

This gem exists largely to handle a GOV.UK Forms service use case and is unlikely to serve other use cases. Consider using these gems instead:

- [govuk-markdown](https://github.com/DFE-Digital/govuk-markdown/) - a more complete Markdown renderer with GOV.UK styles, which includes all standard Markdown syntax plus the ability to create inset text and details components
- [govspeak](https://github.com/alphagov/govspeak) - a powerful Markdown-derived language designed for GOV.UK with many custom extensions
- [redcarpet](https://github.com/vmg/redcarpet) or [Kramdown](https://github.com/gettalong/kramdown) with your own custom configuration, if you need something more bespoke than the above.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## ## Contributing

We welcome contributions - please read [CONTRIBUTING.md](CONTRIBUTING.md) and the [alphagov Code of Conduct](https://github.com/alphagov/.github/blob/main/CODE_OF_CONDUCT.md) before contributing.

## License

We use the [MIT License](https://opensource.org/licenses/MIT).
