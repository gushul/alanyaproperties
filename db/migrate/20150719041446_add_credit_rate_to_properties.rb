class AddCreditRateToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :credit_rate, :float
  end
end
