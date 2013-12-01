require 'httparty'

SCHEDULER.every '1m', first_in: 0 do
  subscription_stats = JSON.parse(HTTParty.get('http://gearup.io/stats.json').body)

  send_event('subscriptions', subscription_stats['subscriptions'])
end
