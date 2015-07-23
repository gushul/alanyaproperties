class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :email
      t.string :phone
      t.string :languages
      t.string :name
      t.string :position
      t.string :photo

      t.timestamps
    end
  end
end
