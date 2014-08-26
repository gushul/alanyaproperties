class WelcomeController < ApplicationController
  def index
    @hot_offers_property = Property.find_by_sql(%q{
SELECT
    properties . *,
    hot_offers.*
FROM
    properties
        LEFT JOIN
    (SELECT
        hot_offers.title,
            hot_offers.description,
            hot_offers.color,
            hot_offers.offerable_id,
            hot_offers.offerable_type
    FROM
        hot_offers
    WHERE
        offerable_type = 'Property'
            AND publish = 1) hot_offers ON hot_offers.offerable_id = properties.id
WHERE
    properties.hot = 1
UNION
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
            hot_offers.offerable_type
    FROM
        hot_offers
    WHERE
        offerable_type = 'Property'
            AND publish = 1) hot_offers ON hot_offers.offerable_id = properties.id

ORDER BY rand()
LIMIT 4
})

    @hot_offers_cities   = HotOffer.cities.published.includes(:offerable).shuffle
    @properties = Property.hot.order('RAND()').limit(4)
    @sliders = Slider.unscoped.slider_type('main').order('RAND()')
    @settings = Setting.get('main')
  end
end
