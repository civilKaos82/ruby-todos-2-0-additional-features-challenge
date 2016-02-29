module ItemWriter
  def self.append(filename, item)
    open(filename, "a") do |file|
      add_item_to_file(file, item)
    end
  end

  def self.write(filename, items)
    open(filename, "w") do |file|
      items.each { |item| add_item_to_file(file, item) }
    end
  end

  private
  def self.add_item_to_file(file, item)
    file << "#{item}\n"
  end

end
