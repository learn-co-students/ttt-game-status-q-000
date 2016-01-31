module LearnGenerate
  module Helpers
    module DotLearnHelper
      def build_dot_learn
        File.open('.learn', 'a') do |f|
          f.write("tags:\n  - tag_1\n  - tag_2\nlanguages:\n  - language_1\n  - language_1\nresources: 0")
        end
      end
    end
  end
end
