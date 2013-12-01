require 'httparty'

SCHEDULER.every '1m', first_in: 0 do
  videos = JSON.parse(HTTParty.get('http://vimeo.com/api/v2/gearupio/videos.json').body)
  info = JSON.parse(HTTParty.get('http://vimeo.com/api/v2/gearupio/info.json').body)
  send_event('vimeo', { info: info, videos: videos })
end
