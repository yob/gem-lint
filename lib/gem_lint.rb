# coding: utf-8

# stdlib
require 'tmpdir'
require 'fileutils'

# our own code
require 'gem_lint/runner'
require 'gem_lint/visitors/abstract_visitor'
require 'gem_lint/visitors/changelog_visitor'
require 'gem_lint/visitors/readme_visitor'
require 'gem_lint/visitors/require_matches_gemname_visitor'
require 'gem_lint/visitors/ruby_file_location_visitor'

module GemLint
  def self.visitors
    [
      GemLint::Visitors::ChangelogVisitor,
      GemLint::Visitors::ReadmeVisitor,
      GemLint::Visitors::RequireMatchesGemnameVisitor,
      GemLint::Visitors::RubyFileLocationVisitor
    ]
  end
end
