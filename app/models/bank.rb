class Bank < ActiveRecord::Base
  
  attr_accessor :price
  
  belongs_to :user
  # user:references で自動生成
  
  validates :user_id, presence: true
  # if user_id empty , we can't connect
  # コネクティングのためのvalidates


end
