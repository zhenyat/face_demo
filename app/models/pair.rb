################################################################################
# Model:  Pair
#
# Purpose:
#
# Pair attributes:
#   base_id         - FK
#   quote_id        - FK
#   name            - string,  not NULL, unique
#   code            - string
#   level           - Liquidity Level: enum { Major (0) | Minor (1) | Exotic (2)}
#   decimal_places  - integer
#   min_price       - decimal
#   max_price       - decimal
#   min_amount      - decimal
#   hidden          - integer
#   fee             - decimal
#   status          - enum { active (0) | archived (1) }
#
#  25.04.2022 Created
################################################################################
class Pair < ApplicationRecord
  include Avatarable
  
  belongs_to :base,  class_name: 'Coin'
  belongs_to :quote, class_name: 'Coin'

  has_many :pair_nicknames, dependent: :delete_all

  has_many   :trades

  enum level:  %w(Major Minor Exotic)
  enum status: %w(active archived)

  validates :base,  presence: true
  validates :quote, presence: true
  validates :name,  presence: true, uniqueness: true
  validates :code,  presence: true, uniqueness: true

  def set_pair_code
    "#{base.code}/#{quote.code}"
  end

  def set_pair_name
    "#{base.code.downcase}_#{quote.code.downcase}"
  end
end
