# coding: utf-8

module GemLint
  class Runner

    attr_reader :tags, :tags_with_level, :email, :name, :version

    def initialize(filename)
      raise ArgumentError, "'#{filename}' does not exist" unless File.file?(filename.to_s)

      @filename = filename
      init_vars
    end

    private

    def init_vars
      unpack_gem
      @tags    = collect_tags
      @tags_with_level = collect_tags_with_level
      @email   = spec ? spec.email : nil
      @name    = spec ? spec.name : nil
      @version = spec ? spec.version.to_s : nil
      cleanup
    end

    # returns an array of symbols, each one indicating a test the provided gem
    # failed. Unpacks the gem to a temporary location and cleans up after
    # itself.
    #
    def collect_tags
      if unpack_successful?
        failed_strategies.map { |s|
          s.tag
        }
      else
        ["unpack-failed"]
      end
    end

    def collect_tags_with_level
      if unpack_successful?
        failed_strategies.map { |s|
          "#{s.level_char}: #{s.tag}"
        }.sort
      else
        ["E: unpack-failed"]
      end
    end

    def failed_strategies
      if unpack_successful?
        @failed_strategies ||= GemLint.strategies.map { |s|
          s.new(visitor_args)
        }.select { |s|
          s.fail?
        }
      else
        @failed_strategies ||= []
      end
    end

    def visitor_args
      @visitor_args ||= {
        :filename      => @filename,
        :data_path     => data_path,
        :metadata_path => metadata_file
      }
    end

    def unpack_successful?
      File.directory?(data_path) && File.file?(metadata_file)
    end

    def data_path
      @data_path ||= File.join(unpack_path, "data")
    end

    def data_file
      @data_file ||= File.join(unpack_path, "data.tar.gz")
    end

    def metadata_gz_file
      @metadata_gz_file ||= File.join(unpack_path, "metadata.gz")
    end

    def metadata_file
      @metadata_file ||= File.join(unpack_path, "metadata")
    end

    def spec
      if @spec || File.file?(metadata_file)
        @spec ||= YAML.load_file(metadata_file)
      else
        nil
      end
    end

    def unpack_path
      @unpack_path ||= File.join(Dir.tmpdir, rand(100000).to_s)
    end

    # TODO: update this to use native ruby untar
    def unpack_gem
      Dir.mkdir(unpack_path)
      Dir.mkdir(data_path)

      `tar -xkC #{unpack_path} -f #{@filename} > /dev/null 2>&1`
      `tar -xzkC #{data_path} -f #{data_file} > /dev/null 2>&1`
      `gunzip #{metadata_file} > /dev/null 2>&1`

      FileUtils.remove_entry_secure(data_file) if File.file?(data_file)

      true
    end

    def cleanup
      return unless File.directory?(unpack_path)

      FileUtils.remove_entry_secure(unpack_path)
    end
  end
end
