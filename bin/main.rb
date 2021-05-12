require_relative '../lib/linters_check'
require 'colorize'

puts 'Linter test is activated'.colorize(:yellow)
puts 'Scanning ... '.colorize(:yellow)
sleep 5

report = LinterCheck.new('js_test.js')

puts "Linter test finds #{report.errors.length} problems".colorize(:yellow)
puts 'Linter tests successfuly passed'.colorize(:green) if report.errors.empty?
puts report.errors
