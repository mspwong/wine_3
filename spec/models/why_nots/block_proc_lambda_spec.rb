require 'spec_helper'

describe WhyNots::BlockProcLambda do

  describe 'block' do
    it 'returns the Proc class' do
      result = subject.what_am_i {}
      result.should == Proc
    end
  end

  describe 'proc' do
    it 'returns proc return value if calling proc is last operation in method' do
      code_block = Proc.new { |a, b| a.to_s << ' ' << b }
      result = subject.straight_forward(123, 'arg1', code_block)
      result.should == "123 arg1"
    end

    it 'returns method return value if calling proc is NOT last operation in method' do
      code_block = Proc.new { |a, b| a.to_s << ' ' << b }
      result = subject.surprise(123, 'arg1', code_block)
      result.should == "not what you think"
    end
  end

end