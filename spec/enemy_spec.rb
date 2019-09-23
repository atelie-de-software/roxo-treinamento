require './src/enemy'

RSpec.describe Enemy do
  describe "method #show" do
    subject { Enemy.new.show }

    it "return caracter" do
      expect(subject).to eq 'W'
    end
  end
end
