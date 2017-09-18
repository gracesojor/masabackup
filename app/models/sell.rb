class Sell < ActiveRecord::Base
  belongs_to :user
  
  # user:references で自動生成
#————— 
  # default_scope -> { order(created_at: :desc) }
#————— 

  #validates :user_id, presence: true
  # if user_id empty , we can't connect
  # コネクティングのためのvalidates
  
  
  validates :name, presence: true
  validates :maker, presence: true
  validates :number, presence: true
  #validates :status, presence: true
  validates :place, presence: true
  validates :price, presence: true
  validates :removal_date, presence: true
  validates :remnant, presence: true
  validates :stage, presence: true
  validates :condition, presence: true
  #validates :remarks, presence: true
  validates :type_machine, presence: true

end