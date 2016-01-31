module LearnDoctor
  class HealthCheck
    class StepInstaller
      attr_reader   :step, :title, :sudo, :password_required
      attr_accessor :file, :result

      def initialize(step)
        @step = step
        @title = step[:title]
        @sudo = step[:sudo]
        @password_required = step[:password]
      end

      def execute
        set_file
        run_install_for_step
        print_result
        unlink_file!

        self
      end

      private

      def set_file
        print "Installing #{title}..."
        self.file = LearnDoctor::HealthCheck::File.new(step, :install)
      end

      def run_install_for_step
        if password_required
          puts "Your password is required to install #{title}."
          print 'Password: '
          password = gets.chomp

          self.result = `#{file.path} #{password}`
        else
          self.result = `#{sudo ? 'sudo ' : ''}#{file.path}`.strip
        end
      end

      def print_result
        if result.match(/Done/)
          puts 'done'.green
        else
          puts 'error'.red
        end
      end

      def unlink_file!
        file.unlink!
      end
    end
  end
end
