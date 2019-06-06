class Reaction < ApplicationRecord
  # Direct associations

  belongs_to :submission,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
