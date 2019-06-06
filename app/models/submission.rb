class Submission < ApplicationRecord
  # Direct associations

  has_many   :reactions,
             :dependent => :destroy

  has_one    :result,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
