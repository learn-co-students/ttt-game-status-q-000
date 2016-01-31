require_relative '../config/environment'
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|

  config.include Rack::Test::Methods
  config.before do
    get '/'
  end

  config.order = 'default'
end
