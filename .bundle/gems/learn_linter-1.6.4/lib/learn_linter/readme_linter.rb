class ReadmeLinter

  def self.parse_file(file, learn_error)
    file_string = File.open(file).read
    if has_code_snippets?(file_string)
      validate_snippets(file_string, learn_error)
    else
      green_light(learn_error)
    end
  end

  def self.green_light(learn_error)
    learn_error.readme_error[:valid_readme] = true
    learn_error.valid_readme = {message: "valid readme", color: :green}
  end

  def self.has_code_snippets?(file)
    file.match(/``/)
  end

  def self.validate_snippets(file, learn_error)
    file.split(" ").each do |chars|
      if chars.match(/``/)
        if !(chars.match(/^```ruby|bash|swift|html|javascript|objc|sql$/))
          break
        else
          green_light(learn_error)
        end
      end
    end
  end
end
    