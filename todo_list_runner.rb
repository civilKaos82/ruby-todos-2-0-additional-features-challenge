require_relative "item"
require_relative "item_parser"
require_relative "list"
require_relative "list_view"

if ARGV.any?
  DATA_FILENAME = "todo_list_data.txt"

  command = ARGV[0]

  case command
  when "list"
    items = ItemParser.parse(DATA_FILENAME)
    list = List.new(items: items)

    puts ListView.new(list)
  end
end
