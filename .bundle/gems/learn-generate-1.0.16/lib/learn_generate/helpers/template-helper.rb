module LearnGenerate
  module Helpers
    module TemplateHelper
      def fundamental_helper
        change_filename('lib/', 'file.rb', 'rb')
        edit_file('spec/spec_helper.rb', formatted_lab_name)
        edit_gemfile
      end

      def command_line_helper
        edit_file("bin/runner.rb", formatted_lab_name)
        edit_file("spec/spec_helper.rb", formatted_lab_name)
        edit_file("lib/environment.rb", formatted_lab_name)
        FileUtils.mv("lib/lab-name", "lib/#{lab_name}")
        edit_gemfile
      end

      def sql_helper
        change_filename('lib/', 'sample.sql', 'sql')
      end

      def rake_helper
        change_filename('lib/', 'file.rb', 'rb')
        edit_file("config/environment.rb", formatted_lab_name)
        edit_gemfile
      end

      def sinatra_mvc_helper
        edit_mvc_gemfile
      end

      def sinatra_classic_helper
        edit_classic_gemfile
      end

      def js_helper
        change_filename('js/', 'file.js', 'js')
      end

      def fe_helper
        edit_file('index.html', formatted_name)
      end

      def kids_helper
        change_filename('lib/', 'file.rb', 'rb')
        edit_file('spec/spec_helper.rb', formatted_lab_name)
        edit_spec("spec/#{formatted_lab_name}_spec.rb")
        edit_gemfile
      end
    end
  end
end
