class Transaction < ActiveRecord::Base

  has_many :entries

  def to_s
    "#{self.description}  #{self.date}"
  end
end
