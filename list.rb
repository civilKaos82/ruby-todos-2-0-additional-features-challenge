class List
  attr_reader :items

  def initialize(args = {})
    @items = args.fetch(:items, Array.new)
  end

  def empty?
    items.empty?
  end
end
