class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :transaction

  after_create :transac
 # after_commit :transaction1
  
  def transac
   Entry.transaction do 
      @cash_balance = Account.find_by_id(1)
      @inventory_balance = Account.find_by_id(2)
      if self.account_id == 1 && self.transaction_type == "Credit"
        @cash_balance.update_attributes(:balance => (@cash_balance.balance - self.amount))
        @cash_balance.save!
      elsif self.account_id == 2 && self.transaction_type == "Debit"
        @inventory_balance.update_attributes(:balance => (@inventory_balance.balance + self.amount))
        @inventory_balance.save!
      end
      save!
    end
  end
end
