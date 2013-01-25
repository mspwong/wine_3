require 'spec_helper'

describe WhyNots::MyClass do
  describe 'class singleton methods' do
    it 'includes all the singleton methods' do
      subject.class.singleton_methods.size.should > 6
    end

    it 'includes the singleton methods for the current class only' do
      subject.class.singleton_methods(false).size.should == 6
    end

    it 'includes the singleton methods defined' do
      subject.class.singleton_methods(false).should include( :first_class_singleton_method, :second_class_singleton_method,
                                                     :third_class_singleton_method, :forth_class_singleton_method,
                                                     :fifth_class_singleton_method, :sixth_class_singleton_method )
    end

    it 'returns the correct value' do
      subject.class.third_class_singleton_method.should == 3
    end
  end

  describe 'object singleton methods' do
    before do
      @obj = subject.class.new

      class << @obj
        def first_object_singleton_method
          11
        end
      end

      def @obj.second_object_singleton_method
        12
      end

      @obj.define_singleton_method(:third_object_singleton_method) do
        13
      end
    end

    it 'includes the singleton methods defined' do
      @obj.singleton_methods.should == [ :first_object_singleton_method, :second_object_singleton_method,
                                    :third_object_singleton_method ]
    end

    it 'returns the correct value' do
      @obj.second_object_singleton_method.should == 12
    end
  end
end