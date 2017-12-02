module LearnWeb
  class Client
    module Lesson
      class CurrentLesson
        attr_reader   :response
        attr_accessor :data, :id, :title, :link, :github_repo, :forked_repo,
                      :assessments, :lab

        include LearnWeb::AttributePopulatable
        include LearnWeb::ResponseParsable

        def initialize(response)
          @response = response

          parse!
        end
      end
    end
  end
end
