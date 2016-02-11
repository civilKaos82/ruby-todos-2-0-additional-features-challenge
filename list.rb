class List
  include Enumerable

  attr_reader :items

  def initialize(args = {})
    @items = args.fetch(:items, Array.new)
  end

  def delete(target)
    item_to_delete = items.find { |item| item.description.downcase.match(target) }

    if item_to_delete
      self.items = items.reject { |item| item == item_to_delete }
      return item_to_delete
    end

    nil
  end

  def each
    items.each do |item|
      yield(item)
    end
  end

  def empty?
    items.empty?
  end

  private
  attr_writer :items
end
