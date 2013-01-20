require 'spec_helper'

describe WhyNots::BlockProcLambda do

  describe 'block' do
    it 'returns the Proc class' do
      result = subject.what_am_i {}
      result.should == Proc
    end
  end

  describe 'proc as argument' do
    describe 'proc as argument' do
      before do
        @code_block = Proc.new { |a, b| return a.to_s << ' ' << b }
      end

      it 'raises error if calling proc is last operation in method' do
        lambda { subject.proc_is_last(123, 'arg1', @code_block) }.should raise_error(LocalJumpError)
      end

      it 'raises error if calling proc is NOT last operation in method' do
        lambda { subject.proc_is_not_last(123, 'arg1', @code_block) }.should raise_error(LocalJumpError)
      end
    end

    describe 'lambda as argument' do
      before do
        @code_block = lambda { |a, b| return a.to_s << ' ' << b }
      end

      it 'get converted to Proc object' do
        @code_block.class.should == Proc
      end

      it 'does not raise error, but returns lambda return value when calling lambda is last operation in method' do
        subject.proc_is_last(123, 'arg1', @code_block).should == "123 arg1"
      end

      it 'does not raise error, but returns method return value when calling lambda is NOT last operation in method' do
        subject.proc_is_not_last(123, 'arg1', @code_block).should == "not what you think"
      end
    end
  end

  describe 'return value' do
    describe 'lambda' do
      it 'returns method return value' do
        subject.lambda_return.should == 'lambda_return method finished'
      end
    end

    describe 'proc' do
      it 'returns proc return value' do
        subject.proc_return.should == 'proc'
      end
    end
  end

end