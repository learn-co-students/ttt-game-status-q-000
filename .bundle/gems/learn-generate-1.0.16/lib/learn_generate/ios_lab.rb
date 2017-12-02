module LearnGenerate
  class IosLab
    attr_reader :lab_name, :liftoff_installed, :liftoffrc_exists,
                :liftoff_dir_exists, :liftoff_backup, :full_templates_path,
                :has_templates_dir

    def initialize(lab_name)
      @lab_name = lab_name
      @liftoff_installed = !(`brew ls --versions liftoff 2>/dev/null`.strip.empty?)
      @liftoffrc_exists = File.exists?(File.expand_path('~/.liftoffrc'))
      @liftoff_dir_exists = File.exists?(File.expand_path('~/.liftoff'))
      @liftoff_backup = LearnGenerate::IosLab::LiftoffBackup.new
      templates_path     = File.expand_path('~/.learn-generate/templates')
      templates_git_path = File.expand_path('~/.learn-generate/templates/.git')
      @has_templates_dir = File.exists?(templates_path) && File.directory?(templates_path) && File.exists?(templates_git_path) && File.directory?(templates_git_path)
      @full_templates_path = templates_path + '/templates'
    end

    def execute
      exit_if_no_liftoff
      backup_if_necessary
      copy_settings_files
      system("liftoff -n #{lab_name}")
      restore_if_necessary
    end

    private

    def exit_if_no_liftoff
      abort 'Please install Liftoff by running `brew tap thoughtbot/formulae && brew install liftoff`' unless liftoff_installed
    end

    def backup_if_necessary
      if liftoff_settings_files_exist?
        liftoff_backup.backup
      end
    end

    def restore_if_necessary
      `rm -rf ~/.liftoff ~/.liftoffrc`

      if liftoff_settings_files_exist?
        liftoff_backup.restore
      end
    end

    def liftoff_settings_files_exist?
      liftoffrc_exists || liftoff_dir_exists
    end

    def copy_settings_files
      if has_templates_dir
        `cp -a #{full_templates_path}/ios/. ~/`
      else
        `cp -a #{LearnGenerate::FileFinder.location_to_dir('../templates/ios')}/. ~/`
      end
    end
  end
end
