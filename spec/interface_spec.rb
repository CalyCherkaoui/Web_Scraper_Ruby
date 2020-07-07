# spec/interface_spec.rb
require_relative '../lib/interface'

describe Interface do
  let(:string_name) { 'houda' }
  let(:test_inerface) { Interface.new('houda') }
  after_option_msg_test = 'Houda! you can download the text exported file in the root folder'

  describe '#initialize' do
    it 'testing initilize method' do
      expect(test_inerface.name).to eql(string_name)
    end
  end

  describe '#after_option_msg' do
    it 'test the method for the agument 3' do
      expect(test_inerface.after_option_msg(3)).to eql(after_option_msg_test)
    end
  end
end
