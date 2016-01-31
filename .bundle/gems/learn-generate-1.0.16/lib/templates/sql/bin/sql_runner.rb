require_relative 'environment'

class SQLRunner

  COMMANDS = ["create", "insert", "update", "delete"]

  def initialize(db)
    @db = db
  end

  def self.make_methods
    COMMANDS.each do |command|
      define_method("execute_sql_#{command}") do 
        sql = File.read("lib/#{command}.sql")
        execute_sql(sql)
      end
    end
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end