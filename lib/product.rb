# noinspection RubyClassVariableUsageInspection
class Product
	attr_reader :title, :stock
	attr_accessor :price

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock] || 0
		add_to_products
	end

	def decrease_stock_by(number_to_decrease)
    if number_to_decrease > stock
      raise OutOfStockError, "#{@title} is out of stock."
    end

    @stock -= number_to_decrease
  end

  def increase_stock_by(number_to_increase)
    @stock += number_to_increase
  end

	# Returns array of all products
	def self.all
    @@products
  end

  # find product by title
  def self.find_by_title(title)
  	@@products.find {|prod| prod.title == title}
  end

  # if this product is in-stock
  def in_stock?
  	@stock > 0
  end

  # Return products in stock
  def self.in_stock
  	@@products.select { |product| product.in_stock? }
  end

  private

  # add to products, duplicated product won't add
  def add_to_products
    if @@products.map(&:title).include? @title
    	raise DuplicateProductError, "#{@title} already exists."
    else
    	@@products << self
    end
  end

end
