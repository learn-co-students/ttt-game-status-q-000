require 'learn_web/client/lesson/current_lesson'
require 'learn_web/client/lesson/current_status'
require 'learn_web/client/lesson/next_lesson'

module LearnWeb
  class Client
    module Lesson
      def current_lesson_endpoint
        "#{API_ROOT}/users/current_lesson"
      end

      def next_lesson_endpoint
        "#{API_ROOT}/users/next_lesson"
      end

      def current_status_endpoint
        "#{API_ROOT}/users/current_lesson/status"
      end

      def current_lesson
        response = get(
          current_lesson_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" }
        )

        LearnWeb::Client::Lesson::CurrentLesson.new(response)
      end

      def next_lesson
        response = get(
          next_lesson_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 'dir_name' => File.basename(FileUtils.pwd) }
        )

        LearnWeb::Client::Lesson::NextLesson.new(response)
      end

      def current_status
        response = get(
          current_status_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" }
        )

        LearnWeb::Client::Lesson::CurrentStatus.new(response)
      end
    end
  end
end
