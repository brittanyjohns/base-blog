class Strain < ApplicationRecord
  has_many :cannabinoids, dependent: :destroy
  has_many :effects, dependent: :destroy
  has_many :terps, dependent: :destroy
end
