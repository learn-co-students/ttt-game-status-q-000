class LearnError < StandardError
  attr_accessor :filepath, :valid_yaml, :valid_license, 
  :present_learn, :present_license, :present_readme, :yaml_error, 
  :readme_error, :license_error, :valid_readme, :correct_yaml_content, 
  :valid_contributing, :present_contributing, :contributing_error

  ESCAPES = { :green  => "\033[32m",
              :yellow => "\033[33m",
              :red    => "\033[31m",
              :reset  => "\033[0m" }


  def initialize
    @yaml_error = {present_dotlearn: false, valid_yaml: false, valid_whitespace: false, attributes: false}
    @readme_error = {present_readme: false, valid_readme: false}
    @license_error = {present_license: false, valid_license: false}
    @contributing_error = {present_contributing: false, valid_contributing: false}

    @correct_yaml_content = {message: ".learn file must have 'tags', 'resources' and 'languages' keys", color: :yellow}

    @valid_yaml = {message: "invalid yaml", color: :red}
    @valid_license = {message: "invalid or missing license content", color: :yellow}
    @valid_readme = {message: "invalid code snippet. Must have three backticks to open and close all code snippets", color: :red}
    @valid_contributing = {message: "invalid or missing contributing content", color: :yellow}

    @present_learn = {message: "missing .learn file", color: :red}
    @present_license = {message: "missing LICENSE.md", color: :red}
    @present_readme = {message: "missing README.md", color: :yellow}
    @present_contributing = {message: "missing CONTRIBUTING.md", color: :yellow}

  end

  def emit(opts={})
    color   = opts[:color]
    message = opts[:message]
    print ESCAPES[color]
    print message
    print ESCAPES[:reset]
    print "\n"
  end

  def total_errors
    {
      dot_learn: yaml_error,
      license: license_error,
      readme: readme_error,
      contributing: contributing_error
    }
    
  end

  def result_message
    [present_learn, valid_yaml, correct_yaml_content, present_license, valid_license, present_readme, valid_readme, valid_contributing, present_contributing]
  end


  def result_output
    result_message.each do |result|
      emit(result)
    end
  end

end