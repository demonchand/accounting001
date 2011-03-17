class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :transaction

  #before_create :valuvation
  #after_save :nothing
  after_create :nothing
  
 # def valuvation
 #   if self.transaction_type == "Debit" && self.account_id == "2"
 #   end
 #   if self.account_id == "1" && self.transaction_type == "Credit"
 #     balance = Entry.find_all_by_id(1)
 #     @current_amount = balance.amount - self.amount
 #     balance.update_attributes(:amount => @current_amount)
 #     save!
 #   end
 # end
  def nothing
    @check_cash = Entry.find_by_id(1)
    @check_inventory = Entry.find_by_id(2)
    if self.id != 1 &&((self.account_id == 1) || (self.transaction_type == "Credit"))
      
#        @temp = @check.amount - self.amountw
      @check_cash.update_attributes(:amount => (@check_cash.amount - self.amount))
      @check_cash.save!
    elsif self.id != 2 && ((self.account_id == 2) || (self.transaction_type == "Debit"))
      @check_inventory.update_attributes(:amount => (@check_inventory.amount + self.amount))
      @check_inventory.save!
    end
    self.save!
  end
end
