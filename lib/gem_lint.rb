# coding: utf-8

# stdlib
require 'tmpdir'
require 'fileutils'

# our own code
require 'gem_lint/runner'
require 'gem_lint/strategies/abstract_strategy'
require 'gem_lint/strategies/bin_ends_with_rb_strategy'
require 'gem_lint/strategies/bin_without_shebang_strategy'
require 'gem_lint/strategies/changelog_strategy'
require 'gem_lint/strategies/no_pkg_dir_strategy'
require 'gem_lint/strategies/readme_strategy'
require 'gem_lint/strategies/require_matches_gemname_strategy'
require 'gem_lint/strategies/ruby_file_location_strategy'
require 'gem_lint/strategies/utf8_metadata_strategy'
require 'gem_lint/strategies/valid_email_strategy'

module GemLint
  def self.strategies
    [
      GemLint::Strategies::BinEndsWithRbStrategy,
      GemLint::Strategies::BinWithoutShebangStrategy,
      GemLint::Strategies::ChangelogStrategy,
      GemLint::Strategies::NoPkgDirStrategy,
      GemLint::Strategies::ReadmeStrategy,
      GemLint::Strategies::RequireMatchesGemnameStrategy,
      GemLint::Strategies::RubyFileLocationStrategy,
      GemLint::Strategies::Utf8MetadataStrategy,
      GemLint::Strategies::ValidEmailStrategy
    ]
  end
end
