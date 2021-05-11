require_relative '../lib/linters_check'
require 'colorize'

report = LinterCheck.new('js_test.js')
puts 'Linter tests successfuly passed'.colorize(:green) if report.errors.empty?
puts report.errors 
