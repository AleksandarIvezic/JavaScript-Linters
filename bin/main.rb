require_relative '../lib/linters_check'

report = LinterCheck.new('js_test.js')

puts report.errors
