require 'rspec'
require_relative '../lib/linters_check'

describe LinterCheck do
    describe "#initialize " do
        context "When file is missing" do
            it "Throws error" do
                expect {described_class.new}.to raise_error(ArgumentError)
            end
        end
    end
end
