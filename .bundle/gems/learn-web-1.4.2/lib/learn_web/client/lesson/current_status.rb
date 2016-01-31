module LearnWeb
  class Client
    module Lesson
      class CurrentStatus
        attr_reader   :response
        attr_accessor :data, :title, :lights, :started, :students_working,
                      :median_completion_time

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
