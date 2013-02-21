class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.text   :message
      t.references :contact_topic
      t.references :contact_person
      t.references :property

      t.timestamps
    end
    add_index :contact_messages, :contact_topic_id
    add_index :contact_messages, :contact_person_id
    add_index :contact_messages, :property_id
  end
end
