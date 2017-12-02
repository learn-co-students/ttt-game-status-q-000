module LearnGenerate
  class FileFinder
    def self.location_to_dir(dir_name)
      new.location_to_dir(dir_name)
    end

    def location_to_dir(dir_name)
      File.join(File.dirname(File.expand_path(__FILE__)), "#{dir_name}")
    end

    def self.location_to_file(file_name)
      new.location_to_file(file_name)
    end

    def location_to_file(file_name)
      File.join(File.dirname(File.expand_path(__FILE__)))
    end
  end
end
