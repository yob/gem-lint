Gem::Specification.new do |s|
  s.name              = "gem-lint"
  s.version           = "0.0.1"
  s.summary           = "Check rubygem files for common mistakes and errors"
  s.description       = "Adds a 'lint' command rubygems that will pront a list of possible errors in a gem"
  s.author            = "James Healy"
  s.email             = "james@yob.id.au"
  s.homepage          = "http://github.com/yob/gem-lint"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "Gem Lint" << "--line-numbers"
  s.files             = Dir.glob("lib/**/*") + Dir.glob("bin/**/*")
  s.required_rubygems_version = ">=1.3.2"
end
