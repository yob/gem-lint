# coding: utf-8

module GemLint
  class Runner

    attr_reader :tags, :tags_with_desc, :tags_with_level
    attr_reader :email, :name, :version

    def initialize(filename)
      raise ArgumentError, "'#{filename}' does not exist" unless File.file?(filename.to_s)

      @filename = filename
      init_vars
    end

    def to_s
      lines.join("\n")
    end

    private

    def init_vars
      unpack_gem
      @tags    = collect_tags
      @email   = spec ? spec.email : nil
      @name    = spec ? spec.name : nil
      @version = spec ? spec.version.to_s : nil
      lines
      cleanup
    end

    def lines
      if unpack_successful?
        @lines ||= failed_strategies.map { |s|
          [s.level_char, self.name, self.version, s.tag, s.description].join(": ")
        }.sort
      else
        @lines ||= [
          ["E", self.name, self.version, "unpack-failed", "There was an error unpacking the gem file"].join(": ")
        ]
      end
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

    def unpack_gem
      Dir.mkdir(unpack_path)
      Dir.mkdir(data_path)

      format = Gem::Format.from_file_by_path(@filename)
      File.open(metadata_file, "wb") { |out| YAML.dump(format.spec, out) }
      format.file_entries.each do |entry, file_data|
        path = entry['path']
        path = File.expand_path File.join(data_path, path)
        raise "Can't install files there" unless path[0, data_path.size] == data_path
        FileUtils.mkdir_p File.dirname(path)
        File.open(path, "wb") { |out| out.write file_data }
      end

      true
    end

    def cleanup
      return unless File.directory?(unpack_path)

      FileUtils.remove_entry_secure(unpack_path)
    end
  end
end
