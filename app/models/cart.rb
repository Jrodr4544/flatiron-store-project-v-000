class Cart < ActiveRecord::Base
  belongs_to  :user
  has_many    :line_items
  has_many    :items, through: :line_items

  def total
    sum = 0
    self.line_items.each do |line_item| 
      sum += line_item.quantity * line_item.item.price
    end
    sum
  end

  def add_item(id)
    line_item = self.line_items.find_by(item_id: id)
    
    if line_item.blank?
      item = Item.find_by(id: id)
      item.line_items.build(quantity: 1, cart: self)      
    else
      line_item.update(quantity: line_item.quantity + 1)
      line_item
    end
  end

  def checkout
    self.status = "Submitted"
    self.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory -= line_item.quantity)
    end
    self.line_items.clear
  end
end
