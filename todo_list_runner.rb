require_relative "item"
require_relative "item_parser"
require_relative "list"
require_relative "list_view"

if ARGV.any?
  DATA_FILENAME = "todo_list_data.txt"

  command = ARGV[0]
  option = ARGV[1]

  case command
  when "list"
    items = ItemParser.parse(DATA_FILENAME)
    list = List.new(items: items)

    puts ListView.new(list)

  when "add"
    item = Item.new(description: option)
    ItemParser.append(DATA_FILENAME, item)

    puts "Appended \"#{option}\" to the list."

  when "remove"
    items = ItemParser.parse(DATA_FILENAME)
    list = List.new(items: items)

    item_to_remove = list.delete(option)

    if item_to_remove
      ItemParser.save(DATA_FILENAME, list.items)
      puts "Removed \"#{item_to_remove.description}\" from the list."
    else
      puts "No item matching \"#{option}\" could be found."
    end
  end
end
