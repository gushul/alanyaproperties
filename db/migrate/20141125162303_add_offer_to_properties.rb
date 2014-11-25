class AddOfferToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :offer, :string
    Property.find_each do |property|
      if property.hot
        property.update_attributes(offer: 'hot')
      end
    end
  end
end
