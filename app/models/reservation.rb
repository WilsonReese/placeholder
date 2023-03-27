class Reservation < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :theater, counter_cache: true
end
