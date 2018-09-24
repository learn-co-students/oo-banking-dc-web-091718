class Transfer
	
	attr_accessor :sender, :receiver, :amount
	attr_reader :status


	def initialize(sender, receiver, amount)
		@sender, @receiver, @amount = sender, receiver, amount
		@status = "pending"
	end

	def valid?
		sender.valid? && receiver.valid? && sender.balance >= @amount 
	end

	def execute_transaction
		if self.valid? && self.status != "complete"
			self.sender.deposit(-self.amount)
			self.receiver.deposit(self.amount)

			@status = "complete"
		else
			@status = "rejected"
			"Transaction rejected. Please check your account balance."

		end
		
	end

	def reverse_transfer
		if self.status == "complete"
			self.sender.deposit(self.amount)
			self.receiver.deposit(-self.amount)
			@status = "reversed"
		end
	end
end
