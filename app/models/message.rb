class Message < ApplicationRecord
  validates :name, length: { minimum: 4 }
  validates :email, presence: true, email: true
  validates :message, length: { minimum: 6 }

  scope :accepted_messages, -> { where(state:'accepted') }
  scope :not_moderate, -> {where(state: "new")}
  scope :not_rejected, -> {where.not(state: "rejected")}

  class << self

    def moderation
      new_messages = Message.not_moderate
      new_messages.where("messages.message REGEXP '[[:<:]]baddd[[:>:]]'").update_all(state: 'rejected')
      new_messages.not_rejected.update_all(state: 'accepted')
    end

  end
end
