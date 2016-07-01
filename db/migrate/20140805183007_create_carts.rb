class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string      :status,  default: "not submitted"
      t.belongs_to  :user
    end
  end
end
