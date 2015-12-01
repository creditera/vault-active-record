$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vault/active_record/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vault-active-record"
  s.version     = Vault::ActiveRecord::VERSION
  s.authors     = ["JohnnyT", "Zach Abrahams", "Mitch Monsen"]
  s.email       = ["johnnyt@nav.com", "zabrahams@nav.com", "mitch@nav.com"]
  s.homepage    = "https://github.com/creditera/vault-active-record"
  s.summary     = "Unofficial Vault plugin for Active Record"
  s.description = s.summary
  s.license     = "MPLv3"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "activerecord", "~> 4.0"
  s.add_dependency "vault", "~> 0.1"

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake",    "~> 10.0"
  s.add_development_dependency "rspec",   "~> 3.2"
  s.add_development_dependency "sqlite3"
end
