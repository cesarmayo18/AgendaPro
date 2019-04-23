class User < ApplicationRecord
    def self.recharge_balance
        User.update_all("balance = balance + 10000")
    end
end
