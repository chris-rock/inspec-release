# encoding: utf-8

require 'yaml'
require 'semantic'
require 'github_changelog_generator'

module InspecPlugins::Release
  class VersionBumper
    def self.bump(path, flag)
      inspec_yml_path = File.join(path, 'inspec.yml')
      metadata = YAML.load_file(inspec_yml_path)

      v = metadata['version']
      semantic_version = Semantic::Version.new v
      new_version = semantic_version.increment!(flag)

      puts "Update #{inspec_yml_path} to #{new_version}"
      metadata['version'] = new_version.to_s

      File.open(inspec_yml_path, 'r+') { |file|
        file.write(metadata.to_yaml)
      }
    end

    def self.changelog(path, options)
      inspec_yml_path = File.join(path, 'inspec.yml')
      metadata = YAML.load_file(inspec_yml_path)

      cl_options = ::GitHubChangelogGenerator::Parser.default_options
      cl_options[:user] = options[:gh_user]
      cl_options[:project] = options[:gh_repo] || metadata['name']
      cl_options[:future_release] = metadata['version']
      cl_options[:output] = File.join(path, 'CHANGELOG.md')

      generator = ::GitHubChangelogGenerator::Generator.new cl_options
      log = generator.compound_changelog
      if !cl_options[:output].empty?
        output_filename = cl_options[:output].to_s
        File.open(output_filename, 'wb') { |file| file.write(log) }
        puts "Generated changelog placed in #{output_filename}"
      else
        puts log
      end
    end
  end
end
