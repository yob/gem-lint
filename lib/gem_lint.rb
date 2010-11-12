# coding: utf-8

# stdlib
require 'tmpdir'
require 'fileutils'

# our own code
require 'gem_lint/runner'
require 'gem_lint/visitors/abstract_visitor'
require 'gem_lint/visitors/bin_ends_with_rb_visitor'
require 'gem_lint/visitors/bin_without_shebang_visitor'
require 'gem_lint/visitors/changelog_visitor'
require 'gem_lint/visitors/readme_visitor'
require 'gem_lint/visitors/require_matches_gemname_visitor'
require 'gem_lint/visitors/ruby_file_location_visitor'
require 'gem_lint/visitors/utf8_metadata_visitor'

module GemLint
  def self.visitors
    [
      GemLint::Visitors::BinEndsWithRbVisitor,
      GemLint::Visitors::BinWithoutShebangVisitor,
      GemLint::Visitors::ChangelogVisitor,
      GemLint::Visitors::ReadmeVisitor,
      GemLint::Visitors::RequireMatchesGemnameVisitor,
      GemLint::Visitors::RubyFileLocationVisitor,
      GemLint::Visitors::Utf8MetadataVisitor
    ]
  end
end
