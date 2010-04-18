# coding: utf-8

# stdlib
require 'tmpdir'
require 'fileutils'

# our own code
require 'gem_lint/runner'
require 'gem_lint/visitors/filename/underscore_visitor'
require 'gem_lint/visitors/filesystem/changelog_visitor'
require 'gem_lint/visitors/filesystem/readme_visitor'

module GemLint
  def self.filename_visitors
    [
      GemLint::Visitors::Filename::UnderscoreVisitor
    ]
  end

  def self.filesystem_visitors
    [
      GemLint::Visitors::Filesystem::ReadmeVisitor,
      GemLint::Visitors::Filesystem::ChangelogVisitor
    ]
  end
end
