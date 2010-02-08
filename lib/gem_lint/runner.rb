# coding: utf-8

module GemLint
  class Runner

    def initialize(filename)
      raise ArgumentError, "'#{filename}' does not exist" unless File.file?(filename.to_s)

      @filename = filename
    end

    # returns an array of symbols, each one indicating a test the provided gem failed
    def tags
      @tags ||= collect_tags
    end

    private

    def collect_tags
      unpack_gem

      tags = Dir.glob(unpack_path + "/**/*")

      cleanup
      tags
    end

    def data_path
      @data_path ||= File.join(unpack_path, "data")
    end

    def data_file
      @data_file ||= File.join(unpack_path, "data.tar.gz")
    end

    def metadata_file
      @metadata_file ||= File.join(unpack_path, "metadata.gz")
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

      FileUtils.remove_entry_secure(data_file)

      true
    end

    def cleanup
      return unless File.directory?(unpack_path)

      FileUtils.remove_entry_secure(unpack_path)
    end
  end
end
