class Cart < ActiveRecord::Base
  belongs_to  :user
  has_many    :line_items
  has_many    :items, through: :line_items

  def total
    sum = 0
    self.line_items.each {|line_item| sum += line_item.item.price }
    sum
  end

  def add_item(id)
    # binding.pry
    item = LineItem.find_by(item_id: id)
    
    if item
      item.update(quantity: item.quantity + 1)
    else
      new_item = LineItem.new(item_id: id, cart_id: self.id)
    end
  end
end
