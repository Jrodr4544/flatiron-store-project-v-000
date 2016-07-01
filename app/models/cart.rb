class Cart < ActiveRecord::Base
  belongs_to  :user
  has_many    :line_items
  has_many    :items, through: :line_items

  def total
    # binding.pry
    sum = 0
    self.line_items.each {|item| }
  end

  def add_item(item)

  end
end
