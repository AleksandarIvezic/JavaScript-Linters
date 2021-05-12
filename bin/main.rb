require_relative '../lib/linters_check'
require 'colorize'

puts 'Linter test is activated'.colorize(:yellow)
sleep 2
puts 'Scanning ... '.colorize(:yellow)
sleep 5

report = LinterCheck.new('js_test.js')

puts "#{report.errors.length} problems detected".colorize(:yellow)
sleep 1
puts 'Linter tests successfuly passed'.colorize(:green) if report.errors.empty?
puts report.errors
