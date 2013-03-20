class AddFromToContactMessages < ActiveRecord::Migration
  def change
    add_column :contact_messages, :from, :date
    add_column :contact_messages, :to, :date
  end
end
