class Transfer

  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    puts @sender.valid?
    if @sender.valid? == false or @amount>@sender.balance
      puts 'test1'
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
    return nil if @status == 'complete'
    sender.deposit((0-@amount))
    receiver.deposit((@amount))
    @status = 'complete'
  end

  def reverse_transfer
    return nil unless @status == 'complete'
    sender.deposit((@amount))
    receiver.deposit((0-@amount))
    @status = 'reversed'
    "Transaction rejected. Please check your account balance."
  end

end
