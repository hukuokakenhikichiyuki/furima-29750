class Order < ApplicationRecord
  belongs_to :user
  has_one :purchase
  attr_accessor :token
  validates :token, presence: true
end
