# noinspection RubyClassVariableUsageInspection
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
		@@customers.find { |customer| customer.name == name }
	end

	def purchase(product)
		Transaction.new(self, product)
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
