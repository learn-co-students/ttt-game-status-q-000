# -*- encoding: utf-8 -*-
# stub: learn_linter 1.6.4 ruby lib

Gem::Specification.new do |s|
  s.name = "learn_linter"
  s.version = "1.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Sophie DeBenedetto"]
  s.date = "2016-01-13"
  s.email = ["sophie.debenedetto@gmail.com"]
  s.executables = ["learn-lint"]
  s.files = ["bin/learn-lint"]
  s.homepage = ""
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.3"
  s.summary = "can lint a directory for valid .learn, license files"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
