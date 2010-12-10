require 'rubygems/command'
require 'gem_lint'

class Gem::Commands::LintCommand < Gem::Command
  def description # :nodoc:
    'Check a gem file for common mistakes and errors'
  end

  def arguments # :nodoc:
    "GEM       built gem to check"
  end

  def usage # :nodoc:
    "#{program_name} GEM"
  end

  def initialize
    super 'lint', description

    add_option('-d', '--detailed', 'Display detailed output') do |value, opts|
      options[:detailed] = true
    end
  end

  def execute
    runner = GemLint::Runner.new(get_one_gem_name)

    if options[:detailed]
      detailed_output(runner)
    else
      simple_output(runner)
    end
  end

  private

  def detailed_output(runner)
    if runner.tags.empty?
      puts "No test failures!"
      puts
    else
      puts runner.to_s(:detailed)
      puts
      exit 1
    end
  end

  def simple_output(runner)
    if runner.tags.empty?
      puts "No test failures!"
      puts
    else
      puts runner.to_s(:simple)
      puts
      exit 1
    end
  end

end
