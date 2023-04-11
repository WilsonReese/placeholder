# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  content_choice :string
#  duration       :float
#  end            :datetime
#  number_guests  :integer
#  start          :datetime
#  status         :string           default("pending")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  theater_id     :integer
#  user_id        :integer
#
# Indexes
#
#  index_reservations_on_theater_id  (theater_id)
#  index_reservations_on_user_id     (user_id)
#
# Foreign Keys
#
#  theater_id  (theater_id => theaters.id)
#  user_id     (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :theater

  scope :upcoming_week, -> { 
    where(start: Time.zone.now..Time.zone.now + 7.days) 
  }
  
  enum status: {
    pending: 'pending',
    confirmed: 'confirmed',
    cancelled: 'cancelled',
    completed: 'completed'
  }
end
