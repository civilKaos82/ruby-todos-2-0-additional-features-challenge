class ItemParser
  class NoFilenameError < StandardError; end

  attr_reader :filename

  def initialize(filename)
    @filename = filename || raise(NoFilenameError, "An item parser needs the filename where item data is stored.")
  end

  def parse
    File.readlines(filename).map { |file_row| item_from_file_data(file_row) }
  end

  def append(item)
    open(filename, "a") do |file|
      add_item_to_file(file, item)
    end
  end

  def save(items)
    open(filename, "w") do |file|
      items.each { |item| add_item_to_file(file, item) }
    end
  end

  private
  COMPLETE_MARKER = "[X]"

  def add_item_to_file(file, item)
    file << "#{item}\n"
  end

  def complete_from_file_data(file_row)
    file_row.match(COMPLETE_MARKER)
  end

  def description_from_file_data(file_row)
    file_row.sub(/^\[.\] /, "").strip
  end

  def item_from_file_data(file_row)
    complete = complete_from_file_data(file_row)
    description = description_from_file_data(file_row)
    Item.new(complete: complete, description: description)
  end
end
