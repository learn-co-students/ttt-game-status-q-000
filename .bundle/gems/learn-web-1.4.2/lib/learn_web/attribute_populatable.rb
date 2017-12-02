module LearnWeb
  module AttributePopulatable
    def self.included(base)
      base.class_eval do
        def populate_attributes!
          data.each do |attribute, value|
            if !self.respond_to?(attribute)
              self.class.class_eval do
                attr_accessor attribute
              end
            end

            self.send("#{attribute}=", value)
          end
        end
      end
    end
  end
end
