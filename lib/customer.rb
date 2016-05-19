class Customer
	attr_reader :name

	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	# return all customers
	def self.all
		@@customers
	end

	# find customer by name
	def self.find_by_name(name)
		@@customers.select { |customer| customer.name == name }.first
		# Q: why this fails to find?
		# @@customers.bsearch { |customer| customer.name == name }
	end

	def purchase(product)
		if product.in_stock?
			Transaction.new(self, product)
		else
			raise OutOfStockError, "#{product.title} is out of stock."
		end
	end

	private 

	def add_to_customers
		if @@customers.map(&:name).include? @name
      raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
	end
end
