class Message < ApplicationRecord
  validates :name, length: { minimum: 4 }
  validates :email, presence: true, email: true
  validates :message, length: { minimum: 6 }
end
