class User < ApplicationRecord
    has_many :articles
    acts_as_authentic
end
