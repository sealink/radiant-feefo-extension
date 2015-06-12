# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'radiant-feefo-extension'

Gem::Specification.new do |s|
  s.name = "radiant-feefo-extension"
  s.version = RadiantFeefoExtension::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stefan Kojic"]
  s.date = "2014-12-02"
  s.description = ""
  s.email = "support@travellink.com.au"
  s.homepage = "https://github.com/sealink/radiant-feefo-extension"
  s.require_paths = ["lib"]
  s.summary = ""

  s.add_development_dependency('redis')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('vcr')
  s.add_development_dependency('webmock')
  s.add_development_dependency('simplecov-rcov')
  s.add_development_dependency('coveralls')

  s.add_dependency 'yamload', '~> 0.2'

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<radiant>, [">= 1.0.0.rc2"])
    else
      s.add_dependency(%q<radiant>, [">= 1.0.0.rc2"])
    end
  else
    s.add_dependency(%q<radiant>, [">= 1.0.0.rc2"])
  end

  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    README.md
    Rakefile
    app/controllers/feefo_controller.rb
    app/models/feefo.rb
    app/models/feefo_review_fetcher.rb
    app/models/feefo_reviews.rb
    app/models/remote_feefo_review_fetcher.rb
    config/feefo.yml.example
    config/routes.rb
    feefo_extension.rb
    lib/radiant-feefo-extension.rb
    lib/tasks/radiant-feefo-extension-tasks.rake
    radiant-feefo-extension.gemspec
    spec/cassettes/feefo_reviews_with_feedback.yml
    spec/feefo_review_fetcher_spec.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

end
