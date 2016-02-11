require_relative "item"
require_relative "item_parser"
require_relative "list"
require_relative "list_view"
require_relative "list_controller"

if ARGV.any?
  DATA_FILENAME = "todo_list_data.txt"

  command = ARGV[0]
  option = ARGV[1]

  item_parser = ItemParser.new(DATA_FILENAME)
  controller = ListController.new(item_parser)

  puts controller.run(command, option)
end
