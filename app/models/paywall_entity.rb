class PaywallEntity < ActiveRecord::Base
  belongs_to :paywall
  attr_accessible :entity, :paywall_id, :paywall

  has_many :turkey_news, through: :paywall_entity, source: :entity, source_type: 'TurkeyNews'
end
