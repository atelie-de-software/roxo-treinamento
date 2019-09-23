require './src/galaxy.rb'

RSpec.describe Galaxy do
  describe '#screen' do
    subject { Galaxy.new.screen }

    it 'returns a string' do
      expect(subject).to be_a String
    end
  end
end
