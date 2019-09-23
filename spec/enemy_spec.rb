require './src/enemy'

RSpec.describe Enemy do
  describe "method #show" do
    subject { Enemy.new(true).show }

    it "return caracter" do
      expect(subject).to eq 'W'
    end
  end

  describe "method #alive?" do
    subject { Enemy.new(alive).alive? }
    context 'when the enemy is alive' do
      let(:alive) { true }
      it "return true" do
        expect(subject).to be_truthy
      end
    end
    context 'when the enemy is dead' do
      let(:alive) { false }

      it "return false" do
        expect(subject).to be_falsey
      end
    end
  end
end
