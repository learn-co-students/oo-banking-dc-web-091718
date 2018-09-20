class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  def valid?
    #compare to see that both sender and receivers accounts are both valid
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if self.valid? && self.status == 'pending' && sender.balance > self.amount
      receiver.balance += self.amount
      sender.balance -= self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == 'complete'
      receiver.balance -= self.amount
      sender.balance += self.amount
      self.status = "reversed"
    end

  end
end
