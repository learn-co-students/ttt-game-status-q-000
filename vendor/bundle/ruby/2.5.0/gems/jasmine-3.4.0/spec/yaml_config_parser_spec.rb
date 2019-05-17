require 'spec_helper'

describe Jasmine::YamlConfigParser do
  it "src_dir uses current working directory when src dir is blank" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"src_dir" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.src_dir).to eq 'some_project_root'
  end

  it "src_dir returns src_dir if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"src_dir" => 'some_src_dir'}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.src_dir).to eq File.join('some_project_root', 'some_src_dir')
  end

  it "jasmine_dir returns nil when jasmine dir is blank" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"jasmine_dir" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.jasmine_dir).to be_nil
  end

  it "jasmine_dir returns jasmine_dir if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"jasmine_dir" => 'some_jasmine_dir'}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.jasmine_dir).to eq File.join('some_project_root', 'some_jasmine_dir')
  end

  it "spec_helper returns default helper path when spec_helper is blank" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"spec_helper" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.spec_helper).to eq 'some_project_root/spec/javascripts/support/jasmine_helper.rb'
  end

  it "spec_helper returns spec_helper if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"spec_helper" => 'some_spec_helper.rb'}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.spec_helper).to eq 'some_project_root/some_spec_helper.rb'
  end

  it "boot_dir returns nil when boot dir is blank" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"boot_dir" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.boot_dir).to be_nil
  end

  it "boot_dir returns boot_dir if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"boot_dir" => 'some_boot_dir'}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.boot_dir).to eq File.join('some_project_root', 'some_boot_dir')
  end

  it "spec_dir uses default path when spec dir is blank" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"spec_dir" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.spec_dir).to eq File.join('some_project_root', 'spec', 'javascripts')
  end

  it "spec_dir returns spec_dir if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"spec_dir" => "some_spec_dir"}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.spec_dir).to eq File.join('some_project_root', 'some_spec_dir')
  end

  it "random returns random if set" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"random" => true}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.random).to eq true
  end

  it "random defaults to true" do
    yaml_loader = lambda do |path|
      if path == "some_path"
        {"random" => nil}
      end
    end
    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', nil, yaml_loader)
    expect(parser.random).to eq true
  end

  it "expands src_file paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_src') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'src_dir' => 'some_src', 'src_files' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.src_files).to eq ['expected_results']
  end

  it "expands stylesheets paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_src') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'src_dir' => 'some_src', 'stylesheets' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.css_files).to eq ['expected_results']
  end

  it "expands spec_file paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_spec') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'spec_dir' => 'some_spec', 'spec_files' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.spec_files).to eq ['expected_results']
  end

  it "expands jasmine_file paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_jasmine') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'jasmine_dir' => 'some_jasmine', 'jasmine_files' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.jasmine_files).to eq ['expected_results']
  end

  it "expands boot_file paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_boot') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'boot_dir' => 'some_boot', 'boot_files' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.boot_files).to eq ['expected_results']
  end

  it "expands jasmine css file paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_jasmine') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'jasmine_dir' => 'some_jasmine', 'jasmine_css_files' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.jasmine_css_files).to eq ['expected_results']
  end

  it "expands helper paths" do
    expander = lambda do |dir, patterns|
      if (dir == File.join('some_project_root', 'some_spec') && patterns == ['some_patterns'])
        ['expected_results']
      end
    end
    yaml_loader = lambda do |path|
      if path == "some_path"
        { 'spec_dir' => 'some_spec', 'helpers' => ['some_patterns'] }
      end
    end

    parser = Jasmine::YamlConfigParser.new('some_path', 'some_project_root', expander, yaml_loader)

    expect(parser.helpers).to eq ['expected_results']
  end

  it "doesn't blow up when blank values are passed" do
    expander = lambda do |dir, patterns|
      raise 'bad arguments' unless patterns.is_a?(Array)
      []
    end
    yaml_loader = lambda do |path|
      {}
    end

    parser = Jasmine::YamlConfigParser.new({}, 'some_project_root', expander, yaml_loader)
    expect(parser.src_files).to eq []
    expect(parser.spec_files).to eq []
    expect(parser.css_files).to eq []
    expect(parser.helpers).to eq []
  end

end
