# spec/interface_spec.rb
require_relative '../lib/interface'

describe Interface do
  let (:string_name) { 'houda' }
  let (:test_inerface) { Interface.new('houda') }

  descrribe 'initialize' do
    it 'testing initilize method' do
      expect(test_inerface.name).to eql(string_name)
    end
  end
end