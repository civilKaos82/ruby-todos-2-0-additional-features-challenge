class List
  include Enumerable

  attr_reader :items

  def initialize(args = {})
    @items = args.fetch(:items, Array.new)
  end

  def each
    items.each do |item|
      yield(item)
    end
  end

  def empty?
    items.empty?
  end
end
