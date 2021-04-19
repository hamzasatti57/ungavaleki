class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def update_amount(type)
    account = Account.first
    case self.class.name
    when Revenue.to_s
      amount = type == 'create' ? account.revenue - self.amount : account.revenue + self.amount
      account.update(revenue: amount)
    when NonSense.to_s
      amount = type == 'create' ? account.nonsense - self.amount : account.nonsense + self.amount
      account.update(nonsense: amount)
    when Plug.to_s
      amount = type == 'create' ? account.plug - self.amount : account.plug + self.amount
      account.update(plug: amount)
    when Operation.to_s
      amount = type == 'create' ? account.operation - self.amount : account.operation + self.amount
      account.update(operation: amount)
    when TimeStamp.to_s
      amount = type == 'create' ? account.time_stamp - self.amount : account.time_stamp + self.amount
      account.update(time_stamp: amount)
    when WhyNot.to_s
      amount = type == 'create' ? account.why_not - self.amount : account.why_not + self.amount
      account.update(why_not: amount)
    end
  end
end
