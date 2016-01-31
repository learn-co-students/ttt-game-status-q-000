module LearnGenerate
  module Helpers
    module GemfileHelper
      def edit_mvc_gemfile
        File.open("Gemfile", 'a') do |f|
          f << "\ngem 'sinatra'
    gem 'activerecord', :require => 'active_record'
    gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
    gem 'rake'
    gem 'require_all'
    gem 'sqlite3'
    gem 'thin'
    gem 'shotgun'
    gem 'pry'
    \ngroup :test do
      gem 'rspec'
      gem 'capybara'
      gem 'rack-test'
      gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
    end"
        end
      end

      def edit_classic_gemfile
        File.open("Gemfile", 'a') do |f|
          f << "\ngem 'sinatra'
    gem 'rake'
    gem 'thin'
    gem 'shotgun'
    gem 'pry'
    gem 'require_all'
    \ngroup :test do
      gem 'rspec'
      gem 'capybara'
      gem 'rack-test'
    end"
        end
      end

      def edit_gemfile
        File.open("Gemfile", 'a') do |f|
          f << "\ngem 'rspec'
    gem 'pry'"
        end
      end
    end
  end
end
