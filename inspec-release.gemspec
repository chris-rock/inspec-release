# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspec-release/version'

Gem::Specification.new do |spec|
  spec.name          = 'inspec-release'

  spec.version       = InspecPlugins::Release::VERSION
  spec.authors       = ['Christoph Hartmann']
  spec.email         = ['chris@lollyrock.com']
  spec.summary       = 'InSpec Plugin to bump InSpec profiles versions and generate changlogs'
  spec.description   = 'This plugin helps users to simplify their profile release cycle'
  spec.homepage      = 'https://github.com/chris-rock/inspec-release'
  spec.license       = 'Apache-2.0'

  spec.files = %w{
    README.md inspec-release.gemspec Gemfile
  } + Dir.glob(
    'lib/**/*', File::FNM_DOTMATCH
  ).reject { |f| File.directory?(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'inspec', '>=2.2.78', '<4.0.0'
  spec.add_dependency 'github_changelog_generator', '~> 1.12.0'
  spec.add_dependency 'semantic', '~> 1.6'
end
