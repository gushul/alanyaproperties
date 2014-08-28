Airbrake.configure do |config|
  config.api_key = 'ff2c1dc0b6cfc1f1db967f602fa8bce3'
  config.host    = 'itsnikolay-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
