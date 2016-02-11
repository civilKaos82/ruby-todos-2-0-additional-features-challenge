class ListView
  def initialize(list)
    @list = list
  end

  def to_s
    list.map(&:to_s).join("\n")
  end

  private
  attr_reader :list
end
