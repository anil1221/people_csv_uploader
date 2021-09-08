# frozen_string_literal: true

# Person model
# first_name :string
# last_name :string
# email :string
# phone :string
# created_at :datetime
# updated_at :datetime
class Person < ApplicationRecord
  attr_accessor :uniq_id

  validates :first_name, :last_name, presence: true

  validates_format_of :phone, with: /\d[0-9]\)*\z/,
                              message: 'Only positive number without spaces are allowed'

  validates_format_of :email,
                      with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
                      message: 'Not a valid email'
end
