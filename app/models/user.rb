class User < ApplicationRecord

    has_secure_password

    validates :name, presence: :true
    validates :email, presence: :true, uniqueness: true

    # def self.authenticate(email, password)
    #     user = find_by_email(email)
    #     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    #         user
    #     else
    #         user
    #     end
    # end

end
