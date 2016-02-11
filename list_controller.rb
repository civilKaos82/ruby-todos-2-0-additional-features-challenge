class ListController
  class NoParserError < StandardError; end
  class InvalidCommand < StandardError; end

  attr_reader :parser

  def initialize(parser)
    @parser = parser || raise(NoParserError, "A list controller needs a parser to interact with the data file.")
  end

  def run(command, option = nil)
    case command
    when "add"      then add(option)
    when "list"     then display_list
    when "remove"   then remove(option)
    when "complete" then complete(option)
    else raise(InvalidCommand, "The command \"#{command}\" is invalid.")
    end
  end

  private
  def items
    @items ||= parser.parse
  end

  def add(description)
    item = Item.new(description: description)
    parser.append(item)

    appended_message(item)
  end

  def appended_message(item)
    "Appended \"#{item.description}\" to the list."
  end

  def complete(target_text)
    item_to_complete = list.find(target_text)

    if item_to_complete
      item_to_complete.mark_complete
      parser.save(list.items)
      marked_complete_message(item_to_complete)
    else
      no_match_message(target_text)
    end
  end

  def display_list
    ListView.new(list).to_s
  end

  def list
    @list ||= List.new(items: items)
  end

  def marked_complete_message(item)
    "Marked \"#{item.description}\" as complete."
  end

  def no_match_message(target_text)
    "No item matching \"#{target_text}\" could be found."
  end

  def remove(target_text)
    removed_item = list.delete(target_text)

    if removed_item
      parser.save(list.items)
      removed_message(removed_item)
    else
      no_match_message(target_text)
    end
  end

  def removed_message(item)
    "Removed \"#{item.description}\" from the list."
  end
end
