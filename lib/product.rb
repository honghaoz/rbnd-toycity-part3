class Product
	attr_reader :title
	attr_accessor :price, :stock

	@@products = []

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock] || 0
		add_to_products
	end

	# Returns array of all products
	def self.all
    @@products
  end

  # find product by title
  def self.find_by_title(title)
  	@@products.bsearch {|prod| prod.title == title}
  end

  # if this product is in-stock
  def in_stock?
  	@stock > 0
  end

  # Return products in stock
  def self.in_stock
  	@@products.select { |product| product.stock > 0 }
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
