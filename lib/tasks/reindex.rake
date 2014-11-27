namespace :task do
  task reindex: :environment do
    models = [Property]
    models.each do |model|
      p model
      p model.reindex
    end
  end
end
