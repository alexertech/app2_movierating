class User < ApplicationRecord
    def self.authenticate(email, passwd)

        user = User.where(email: email).first

        if user && user.passwd == passwd
            user
        else
            nil
        end
    end

end
