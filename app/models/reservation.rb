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
#  status         :string
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
end
