require "calculator"

describe Calculator do
  # for it exchange subject by calc
  # subject(:calc) { described_class.new() }
  # case you use a description more verbal in describe
  # it alter "described_class.new" for "CLASS.new = Calculator.new"
  # for executing only one test, indicate the  file path and use the tag '-e' + test's
  context "#sum" do
    it 'divide by 0' do
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError)
      expect { subject.div(3, 0) }.to raise_error('divided by 0')
      expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError,'divided by 0')
      expect { subject.div(3, 0) }.to raise_error(/divided/)
    end

    it "with positive number" do
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end

    it "with negative and psitive numbers" do
      result = subject.sum(-5, 7)
      expect(result).to eq(2)
    end
    # xit is used to skip the test
    it "with negative number" do
      result = subject.sum(-5, -7)
      expect(result).to eq(-12)
    end
  end
end
