class User < ApplicationRecord
    has_many :bets
    def self.recharge_balance
        User.update_all("balance = balance + 10000")
        puts Forecast::forecast_api
    end

    def self.forecast_api
        url = 'http://api.tiempo.com/index.php?api_lang=es&localidad=18578&affiliate_id=59nzhollgr59'
        response = RestClient.get(url)
        forecast = Hash.from_xml(response)["report"]["location"]["var"][3]["data"]["forecast"]
        forecast.each do |day|
            return true if day["id"].to_i.between? 6, 10
        end
        return false
    end 
end
