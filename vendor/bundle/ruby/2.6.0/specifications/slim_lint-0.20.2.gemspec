# -*- encoding: utf-8 -*-
# stub: slim_lint 0.20.2 ruby lib

Gem::Specification.new do |s|
  s.name = "slim_lint".freeze
  s.version = "0.20.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shane da Silva".freeze]
  s.date = "2020-10-13"
  s.description = "Configurable tool for writing clean and consistent Slim templates".freeze
  s.email = ["shane@dasilva.io".freeze]
  s.executables = ["slim-lint".freeze]
  s.files = ["bin/slim-lint".freeze]
  s.homepage = "https://github.com/sds/slim-lint".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Slim template linting tool".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubocop>.freeze, [">= 0.78.0"])
      s.add_runtime_dependency(%q<slim>.freeze, [">= 3.0", "< 5.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<rubocop>.freeze, [">= 0.78.0"])
      s.add_dependency(%q<slim>.freeze, [">= 3.0", "< 5.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<rubocop>.freeze, [">= 0.78.0"])
    s.add_dependency(%q<slim>.freeze, [">= 3.0", "< 5.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, ["~> 1.0"])
  end
end
