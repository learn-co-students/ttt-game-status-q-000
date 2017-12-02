require 'bundler/setup'
Bundler.require
require 'erb'

require_relative '../app/application'
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each do |f|
  require f
end