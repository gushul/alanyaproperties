# encoding: utf-8
class Admin::HotOffers::PropertiesController < Admin::HotOffers::BaseController

  def index
    @resources = Property.find_by_sql(%q{
SELECT
    properties . *,
    hot_offers.*
FROM
    properties
        JOIN
    (SELECT
        hot_offers.title,
            hot_offers.description,
            hot_offers.color,
            hot_offers.offerable_id,
            hot_offers.offerable_type,
            hot_offers.id as hot_offer_id,
            hot_offers.publish
    FROM
        hot_offers
    WHERE
        offerable_type = 'Property'
            ) hot_offers ON hot_offers.offerable_id = properties.id
    })

  end
end
