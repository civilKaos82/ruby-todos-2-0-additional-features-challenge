require_relative "spec_helper"

describe ItemParser do
  after(:all) do
    File.truncate(TEST_DATA_FILENAME, 0)
  end

  describe "parsing items from a file" do
    before(:all) do
      # Add lines to the data file.
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
        item_data_file << "[ ] Hit the gym.\n"
      end

      @parsed_items = ItemParser.parse('spec/support/test_item_data.txt')
    end

    it "creates an object for each row in the file" do
      expect(@parsed_items.count).to eq 2
    end

    it "creates completed items correctly" do
      expect(@parsed_items.first).to be_complete
    end

    it "creates incomplete items correctly" do
      expect(@parsed_items.last).to be_incomplete
    end

    it "assigns descriptions correctly" do
      expect(@parsed_items.first.description).to eq "Walk the cat."
    end
  end

  describe "appending an item to the file" do
    before(:all) do
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
      end
    end

    it "appends a line representing the item to the file" do
      item = Item.new(description: "Learn something new.", complete: false)
      ItemParser.append(TEST_DATA_FILENAME, item)
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n[ ] Learn something new.\n"
    end
  end

  describe "saving a collection of items" do
    before(:all) do
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
      end
    end

    it "replaces the contents of the file with data representing the items" do
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n"

      item_1 = Item.new(description: "Eat breakfast.", complete: true)
      item_2 = Item.new(description: "Eat lunch.", complete: false)
      items = [item_1, item_2]

      ItemParser.save(TEST_DATA_FILENAME, items)
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Eat breakfast.\n[ ] Eat lunch.\n"
    end
  end
end
