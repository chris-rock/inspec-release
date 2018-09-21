# encoding: utf-8

require 'inspec-release/bumper'

module InspecPlugins::Release
  class CliCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc 'release [COMMAND]', 'helps with tasks to release InSpec profiles'

    desc 'major (PROFILE PATH)', 'Bumps the major version of an InSpec profile.'
    option :changelog, desc: 'Include a changelog update', type: :boolean, default: false, aliases: [:c]
    option :gh_user, desc: 'Github username/org', type: :string, aliases: [:u]
    option :gh_repo, desc: 'Github repo name (defaults to inspec profile name)', type: :string, aliases: [:r]
    def major(path)
      InspecPlugins::Release::VersionBumper.bump(path, :major)
      if options[:changelog]
        InspecPlugins::Release::VersionBumper.changelog(path, options)
      end
    end

    desc 'minor (PROFILE PATH)', 'Bumps the minor version of an InSpec profile'
    option :changelog, desc: 'Include a changelog update', type: :boolean, default: false, aliases: [:c]
    option :gh_user, desc: 'Github username/org', type: :string, aliases: [:u]
    option :gh_repo, desc: 'Github repo name (defaults to inspec profile name)', type: :string, aliases: [:r]
    def minor(path)
      InspecPlugins::Release::VersionBumper.bump(path, :minor)
      if options[:changelog]
        InspecPlugins::Release::VersionBumper.changelog(path, options)
      end
    end

    desc 'patch (PROFILE PATH)', 'Bumps the patch version of an InSpec profile'
    option :changelog, desc: 'Include a changelog update', type: :boolean, default: false, aliases: [:c]
    option :gh_user, desc: 'Github username/org', type: :string, aliases: [:u]
    option :gh_repo, desc: 'Github repo name (defaults to inspec profile name)', type: :string, aliases: [:r]
    def patch(path)
      InspecPlugins::Release::VersionBumper.bump(path, :patch)
      if options[:changelog]
        InspecPlugins::Release::VersionBumper.changelog(path, options)
      end
    end

    desc 'changelog', 'List resources that are included with InSpec.'
    option :gh_user, desc: 'Github username/org', type: :string, aliases: [:u]
    option :gh_repo, desc: 'Github repo name (defaults to inspec profile name)', type: :string, aliases: [:r]
    def changelog(path)
      InspecPlugins::Release::VersionBumper.changelog(path, options)
    end
  end
end
