class CreateContactTopics < ActiveRecord::Migration
  def change
    create_table :contact_topics do |t|
      t.string :name

      t.timestamps
    end
  end
end
