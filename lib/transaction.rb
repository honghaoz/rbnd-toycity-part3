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
    @@transactions.select {|transaction| transaction.customer.name == customer.name}
  end

  # Finds all Transactions by product involved
  def self.find_by_product(product)
    @@transactions.select {|transaction| transaction.product.title == product.title}
  end

  # Prints all transactions
  def self.print_all_transactions
  	puts @@transactions.inject("Transactions: \n") { |result, transaction| 
  		result += "#{transaction.id} \t#{transaction.product.title}\t#{transaction.customer.name}\n"
  	}
  end

end
