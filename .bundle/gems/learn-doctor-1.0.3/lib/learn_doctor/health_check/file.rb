module LearnDoctor
  class HealthCheck
    class File
      attr_reader   :step, :check_or_install, :conn
      attr_accessor :file

      def initialize(step, check_or_install)
        @step             = step
        @check_or_install = check_or_install
        @conn             = Faraday.new

        prepare_file!

        return self
      end

      def unlink!
        self.file.unlink
      end

      def path
        file.path
      end

      private

      def prepare_file!
        create_file!
        write_to_file!
        make_executable!
      end

      def create_file!
        self.file = Tempfile.new(step[:title].gsub(' ', '_'))
      end

      def write_to_file!
        response = conn.get(step[check_or_install])
        file.write(response.body.sub('#!/bin/bash', '#!/bin/bash -l'))
        file.rewind
      end

      def make_executable!
        FileUtils.chmod('+x', file.path)
      end
    end
  end
end
