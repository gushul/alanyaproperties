class AddContactSkypeToContactMessages < ActiveRecord::Migration
  def change
    add_column :contact_messages, :contact_skype, :string
  end
end
