require_relative 'spec_helper'

describe List do
  let(:completed_item) { Item.new(description: "Sleep in.", complete: true) }
  let(:incomplete_item) { Item.new(description: "Take a nap.", complete: false) }
  let(:list) { List.new(items: [completed_item, incomplete_item]) }

  it "has items" do
    expect(list.items).to match_array [completed_item, incomplete_item]
  end

  it "defaults to be empty if no items are given" do
    empty_list = List.new
    expect(empty_list).to be_empty
  end

  it "is not empty if it has items" do
    expect(list).to_not be_empty
  end
end
