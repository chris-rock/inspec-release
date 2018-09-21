#!/usr/bin/env rake
# encoding: utf-8

# Rubocop
begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:lint)
rescue LoadError
  puts 'rubocop is not available. Install the rubocop gem to run the lint tests.'
end

# run tests
task default: [:lint]

