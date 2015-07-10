namespace :count_of_views do
  task seed: :environment do
    models = [Property, TurkeyNews, Service, City, AboutPage]
    models.each do |m|
      p m
      m.all.each do |p|
        p.update_attributes!( count_of_views: rand(100..500) )
      end
    end
  end
end
