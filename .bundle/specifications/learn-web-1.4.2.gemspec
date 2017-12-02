# -*- encoding: utf-8 -*-
# stub: learn-web 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "learn-web"
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Flatiron School"]
  s.date = "2015-09-28"
  s.email = ["learn@flatironschool.com"]
  s.homepage = "https://learn.co"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.3"
  s.summary = "An interface to Learn.co"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.9"])
      s.add_runtime_dependency(%q<oj>, ["~> 2.9"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<faraday>, ["~> 0.9"])
      s.add_dependency(%q<oj>, ["~> 2.9"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<faraday>, ["~> 0.9"])
    s.add_dependency(%q<oj>, ["~> 2.9"])
  end
end
