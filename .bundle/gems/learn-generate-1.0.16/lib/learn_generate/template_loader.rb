module LearnGenerate
  class TemplateLoader
    attr_reader   :internet, :local_path, :local_dir
    attr_accessor :templates

    BASE_TEMPLATES = [
      'fundamental-ruby',
      'command-line',
      'sql',
      'activerecord',
      'rake',
      'erb-static-site',
      'rack',
      'sinatra-classic',
      'sinatra-classic-db',
      'sinatra-mvc',
      'js',
      'front-end',
      'kids',
      'readme'
    ]

    def initialize(internet)
      @internet   = internet
      @local_dir  = File.expand_path('~/.learn-generate')
      @local_path = File.expand_path('~/.learn-generate/templates')

      set_templates
    end

    def printable_list
      templates.map.with_index do |template, index|
        "#{index+1}. #{template}"
      end.join("\n  ")
    end

    private

    def set_templates
      if internet
        if has_local_copy?
          get_and_update_templates
        else
          prep_local_copy
          get_and_update_templates(silent: true)
        end
      elsif has_local_copy?
        update_local_templates
      else
        set_base_templates
      end
    end

    def prep_local_copy
      create_local_dir
      clone_templates_repo
    end

    def create_local_dir
      FileUtils.mkdir_p(local_dir)
    end

    def clone_templates_repo
      puts 'Pulling list of known templates...'
      system("cd #{local_dir} && git clone https://github.com/learn-co-curriculum/learn-generate-templates.git templates")
    end

    def get_and_update_templates(silent: false)
      get_latest_templates(silent: silent)
      update_local_templates
    end

    def get_latest_templates(silent: false)
      puts 'Updating templates...' if !silent
      system("cd #{local_path} && git pull --rebase --quiet")
    end

    def update_local_templates
      self.templates = Dir.entries("#{local_path}/templates").reject {|f| f.start_with?('.') || !File.directory?("#{local_path}/templates/#{f}")}
    end

    def set_base_templates
      self.templates = BASE_TEMPLATES
    end

    def has_local_copy?
      has_templates_dir? && templates_dir_is_git_repo?
    end

    def has_templates_dir?
      File.exists?(local_path) && File.directory?(local_path)
    end

    def templates_dir_is_git_repo?
      File.exists?("#{local_path}/.git") && File.directory?("#{local_path}/.git")
    end
  end
end
