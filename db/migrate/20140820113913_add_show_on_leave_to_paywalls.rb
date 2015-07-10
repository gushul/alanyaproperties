class AddShowOnLeaveToPaywalls < ActiveRecord::Migration
  def change
    add_column :paywalls, :show_on_leave, :boolean, default: false
  end
end
