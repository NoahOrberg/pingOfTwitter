require "twitter"
require "json"
require "date"

class Kera
  def initialize
    id = "" # target id
    ENV['TZ']= "Asia/Tokyo"

    j_file= "./src/user_data.json"
    key= open(j_file) do |io|
      JSON.load(io)
    end

    client=Twitter::REST::Client.new do |config|
        config.consumer_key= key["c_k"]
        config.consumer_secret= key["c_s"]
        config.access_token= key["a_t"]
        config.access_token_secret= key["a_s"]
    end
    tweet = client.user_timeline(id, {count:1})[0]
    while true do
      if !tweet.retweeted? then
        break
      end
      tweet = client.user_timeline(id, {max_id:max_id-1,count:1})[0]
    end
    if Time.now - tweet.created_at >= 300.0 then
      client.update("@"+id+" 浮上してないけど大丈夫?") # message
    end
  end
end

