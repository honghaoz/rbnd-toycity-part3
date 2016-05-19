class Transaction

	@@id = 0
	@@transactions = []

	attr_reader :customer, :product, :id

	def initialize(customer, product)
		@customer = customer
		@product = product
		product.stock -= 1
		@id = @@id + 1
		@@id += 1

		@@transactions << self

	end

	# Returns all transactions
	def self.all
		@@transactions
	end

	# Finds and returns transaction by number
	def self.find(id)
		@@transactions.find { |t| t.id == id }
	end

	# Finds all Transactions by the customer involved
  def self.find_by_customer(customer)
    @@transactions.select {|trans| trans.customer.name == customer.name}
  end

  # Finds all Transactions by product involved
  def self.find_by_product(product)
    @@transactions.select {|trans| trans.product.title == product.title}
  end

end
