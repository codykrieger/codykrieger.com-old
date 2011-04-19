# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bartt-ssl_requirement}
  s.version = "1.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["RailsJedi", "David Heinemeier Hansson", "jcnetdev", "bcurren", "bmpercy", "revo", "nathany", "bartt", "Thorben Schr\303\266der"]
  s.date = %q{2011-03-25}
  s.description = %q{SSL requirement adds a declarative way of specifying that certain actions should only be allowed to run under SSL, and if they're accessed without it, they should be redirected.}
  s.email = %q{bart@thecodemill.biz}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "README",
     "Rakefile",
     "VERSION",
     "bartt-ssl_requirement.gemspec",
     "init.rb",
     "lib/ssl_requirement.rb",
     "lib/url_for.rb",
     "rails/init.rb",
     "shoulda_macros/ssl_requirement_macros.rb",
     "test/ssl_requirement_test.rb",
     "test/url_for_test.rb"
  ]
  s.homepage = %q{http://github.com/bartt/ssl_requirement}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Allow controller actions to force SSL on specific parts of the site.}
  s.test_files = [
    "test/ssl_requirement_test.rb",
     "test/url_for_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

