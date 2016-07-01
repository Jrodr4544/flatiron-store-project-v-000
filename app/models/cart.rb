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
    line_item = LineItem.find_by(item_id: id)
    
    if line_item
      line_item.update(quantity: line_item.quantity + 1)
    else
      line_item = LineItem.new(item_id: id, cart_id: self.id)
    end
    line_item
  end

  def checkout
    self.status = "Submitted"
    self.line_items.clear
    self.save
  end
end
