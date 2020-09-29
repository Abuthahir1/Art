class User < ApplicationRecord
   authenticates_with_sorcery!
   enum category: ['Art Owner', 'Art Buyers']
   has_many :arts
   has_many :reviews, dependent: :destroy
end
