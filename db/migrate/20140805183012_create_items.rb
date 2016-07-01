class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
    end
  end
end
