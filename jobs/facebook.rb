require 'httparty'

SCHEDULER.every '1m', first_in: 0 do
  facebook_stats = JSON.parse(HTTParty.get('http://graph.facebook.com/gearup.io').body)
  send_event('facebook', facebook_stats)
end
