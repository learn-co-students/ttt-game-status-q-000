module LearnGenerate
  class TemplateMaker
    include LearnGenerate::Helpers::TemplateHelper
    include LearnGenerate::Helpers::GemfileHelper
    include LearnGenerate::Helpers::DotLearnHelper

    attr_reader :template_type, :lab_name, :has_templates_dir, :full_templates_path

    def initialize(template_type, lab_name)
      @template_type = template_type
      @lab_name = lab_name
      templates_path     = File.expand_path('~/.learn-generate/templates')
      templates_git_path = File.expand_path('~/.learn-generate/templates/.git')
      @has_templates_dir = File.exists?(templates_path) && File.directory?(templates_path) && File.exists?(templates_git_path) && File.directory?(templates_git_path)
      @full_templates_path = templates_path + '/templates'
    end

    def self.run(template_type, lab_name)
      new(template_type, lab_name).create
    end

    def create
      if template_type != 'ios'
        copy
        name_lab
        FileUtils.cd("#{lab_name}") do
          touch_spec unless ['js', 'sinatra-mvc', 'front-end', 'python', 'readme'].include?(template_type)
          touch_dot_learn
          build_dot_learn
          git_init
          bundle_init unless ['js', 'front-end', 'python', 'readme'].include?(template_type)
          edit_readme
          fundamental_helper if template_type == "fundamental-ruby"
          command_line_helper if template_type == "command-line"
          sql_helper if template_type == "SQL"
          rake_helper if template_type == "rake"
          sinatra_mvc_helper if template_type == "sinatra-mvc"
          sinatra_classic_helper if template_type == "sinatra-classic"
          js_helper if template_type == "js"
          fe_helper if template_type == "front-end"
          kids_helper if template_type == "kids"
          add_link_to_learn
        end
      else
        create_ios_lab
      end

      success_message
    end

    def create_ios_lab
      LearnGenerate::IosLab.new(lab_name).execute
    end

    def copy
      if has_templates_dir
        FileUtils.cp_r("#{full_templates_path}/#{template_type}", FileUtils.pwd)
      else
        FileUtils.cp_r(LearnGenerate::FileFinder.location_to_dir("../templates/#{template_type}"), FileUtils.pwd)
      end
    end

    def name_lab
      FileUtils.mv(template_type, lab_name)
    end

    def git_init
      `git init`
    end

    def edit_readme
      readme_contents = File.read('README.md')
      readme_contents.sub!('## Objectives', "# #{formatted_name}\n\n## Objectives")

      File.open('README.md', 'w+') do |f|
        f.write(readme_contents)
      end
    end

    def formatted_name
      lab_name.gsub('-', ' ').split.map(&:capitalize).join(' ')
    end

    def formatted_lab_name
      lab_name.gsub('-', '_')
    end

    def bundle_init
      `bundle init`
    end

    def touch_spec
      FileUtils.cd("spec/") do
        `touch #{formatted_lab_name}_spec.rb`
      end
    end

    def touch_dot_learn
      `touch .learn`
    end

    def change_filename(path, filename, extension)
      FileUtils.cd(path) do
        File.rename(filename, "#{formatted_lab_name}.#{extension}")
      end
    end

    def edit_file(file, text)
      new_rr = IO.read(file) % { file_name: text }
      File.open(file, 'w') { |f| f.write(new_rr) }
    end

    def edit_spec(file)
      File.open(file, 'w') { |f| f.write("require_relative './spec_helper'") }
    end

    def success_message
      puts "\n#{formatted_name} Lab successfully created in #{FileUtils.pwd}\n"
      FileUtils.cd("#{lab_name}") do
        tree_output = `which tree 2>/dev/null`

        if !tree_output.empty?
          puts "#{`tree`}"
        end
      end
    end

    def add_link_to_learn
      File.open('README.md', 'a') do |f|
        f << "\n<a href='https://learn.co/lessons/#{lab_name}' data-visibility='hidden'>View this lesson on Learn.co</a>\n"
      end
    end
  end
end
