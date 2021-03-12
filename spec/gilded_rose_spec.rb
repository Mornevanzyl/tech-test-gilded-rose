require 'gilded_rose'

describe GildedRose do
  # let(:dish) { double(:dish) }
  let(:item) { Item.new('foo', 10, 10) }
  let(:item2) { Item.new('bar', 1, 10)}
  let(:items) { [item, item2] }
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

    it 'quality degrades twice as fast once sell-by date has passed' do
      3.times { gildedrose.update_quality() }
      expect(items[1].quality).to eq 5
    end
  end

end
