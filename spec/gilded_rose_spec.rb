require 'gilded_rose'

describe GildedRose do
  # let(:dish) { double(:dish) }
  let(:item) { Item.new('foo', 10, 10) }
  let(:items) { [item] }
  subject(:gildedrose) { described_class.new(items) }

  describe "#update_quality" do
    it "does not change the name" do
      # items = [Item.new("foo", 0, 0)]
      # GildedRose.new(items).update_quality()
      gildedrose.update_quality()
      expect(items[0].name).to eq "foo"
    end
  end
  
  describe 'Normal behaviour' do

    it 'updates sell-by date with -1 every day' do
      gildedrose.update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it 'updates quality by -1 every day' do
      gildedrose.update_quality()
      expect(items[0].quality).to eq 9
    end

    it 'quality can never go below 0' do
      11.times { gildedrose.update_quality() }
      expect(items[0].quality).to eq 0
    end
  end

end
