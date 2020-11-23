class Account < ApplicationRecord
  validates :balance, :numericality => { :greater_than_or_equal_to => 0}

  def withdraw(amount)
    update!(balance: balance - amount)
  end

  def deposit(amount)
    update!(balance: balance + amount)
  end

  def transfert(recipient, amount)
    transaction do 
      withdraw(amount)
      recipient.deposit(amount)
    end
  end
end
