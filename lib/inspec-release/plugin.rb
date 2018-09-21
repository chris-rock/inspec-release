# encoding: UTF-8

require 'inspec-release/version'

module InspecPlugins
  module Release
    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-release'

      cli_command :release do
        require 'inspec-release/cli_command'
        InspecPlugins::Release::CliCommand
      end
    end
  end
end
