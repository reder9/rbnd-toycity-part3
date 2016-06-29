class Product
  attr_reader :title, :stock, :price

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @stock = options[:stock]
    @price = options[:price]
    add_to_products
  end

  def self.all
    @@products
  end

  def in_stock?
      stock > 0
  end

  private

  def add_to_products
    if @@products.include?  self.title
      raise DuplicateProductError, "Error, " + self.title + "already exists"
    else
      @@products << self
    end
  end

  def self.find_by_title(title)
  @@products.find { |product| product.title == title }
  end

  def self.in_stock
    @@products.select { |product| product.in_stock?}
  end

end
