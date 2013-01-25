require 'spec_helper'

describe WhyNots::BlockProcLambdaMethodObject do

  describe 'block' do
    it 'a block is a Proc object' do
      result = subject.what_am_i {}
      result.should == Proc
    end

    it 'a proc is a Proc object' do
      result = subject.what_kind_of_block_am_i(Proc.new {})
      result.should == Proc
    end

    it 'a lambda is a Proc object' do
      result = subject.what_kind_of_block_am_i(lambda {})
      result.should == Proc
    end
  end

  describe 'block as argument' do
    describe 'proc' do
      before do
        @code_block = Proc.new { |a, b| return a.to_s << ' ' << b }
      end

      it 'raises error if calling proc is last operation in method' do
        lambda { subject.block_is_last(123, 'arg1', @code_block) }.should raise_error(LocalJumpError)
      end

      it 'raises error if calling proc is NOT last operation in method' do
        lambda { subject.block_is_not_last(123, 'arg1', @code_block) }.should raise_error(LocalJumpError)
      end
    end

    describe 'lambda' do
      before do
        @code_block = lambda { |a, b| return a.to_s << ' ' << b }
      end

      it 'get converted to Proc object' do
        @code_block.class.should == Proc
      end

      it 'does not raise error, but returns lambda return value when calling lambda is last operation in method' do
        subject.block_is_last(123, 'arg1', @code_block).should == "123 arg1"
      end

      it 'does not raise error, but returns method return value when calling lambda is NOT last operation in method' do
        subject.block_is_not_last(123, 'arg1', @code_block).should == "not what you think"
      end
    end
  end

  describe 'return value in block' do
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

  describe 'method object' do

    def code_block(a, b)
      a.to_s << ' ' << b
    end

    before do
      @method_object = method(:code_block)
    end

    it 'is a Method object' do
      @method_object.class.should == Method
    end

    it 'behaves like a lambda when the calling the method object is the last operation in the method' do
      subject.block_is_last(123, 'arg1', @method_object).should == '123 arg1'
    end

    it 'behaves like a lambda when calling the method object is NOT the last operation in the method' do
      subject.block_is_not_last(123, 'arg1', @method_object).should == 'not what you think'
    end
  end

end