module LearnStatus
  class Report
    class Formatter
      attr_reader   :status
      attr_accessor :lights

      extend Forwardable

      def_delegators :status, :title, :started, :students_working,
                     :median_completion_time

      def initialize(status)
        @status = status
      end

      def execute
        build_lights_status

        self
      end

      def printable_output
        <<-OUTPUT

Current Lesson: #{title}
Started: #{started}
Students Working: #{students_working}
Median Completion Time: #{median_completion_time}

#{lights_output}
        OUTPUT
      end

      private

      def lights_output
        output = ''

        self.lights.each do |light|
          output << "#{light[:title]}: "

          if light[:color]
            output << '●'.send(light[:color])
          else
            output << 'x'
          end

          if light[:tests]
            output << " (Passing: #{light[:tests][:passing]} / Failing: #{light[:tests][:failing]})"
          end

          output << "\n"
        end

        output
      end

      def build_lights_status
        self.lights = status.lights.map do |light|
          {
            title: light[:type].split('_').map(&:capitalize).join(' '),
            color: if light[:started]
              light[:passing] ? :green : :red
            end,
            tests: if light[:tests_passing]
              {
                passing: light[:tests_passing],
                failing: light[:tests_failing]
              }
            end
          }
        end
      end
    end
  end
end
