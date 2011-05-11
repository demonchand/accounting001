class AddBalanceToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :balance, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :accounts, :balance
  end
end
