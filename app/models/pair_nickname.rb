################################################################################
# Model:  PairNickname
#
# Purpose:
#
# PairNickname attributes:
#   pair_id   - FK
#   name      - string,  not NULL, unique
#   status    - enum { active (0) | archived (1) }
#
#  25.04.2022 Created
################################################################################
class PairNickname < ApplicationRecord
  belongs_to :pair, required: true

  enum status: %w(active archived)

  validates :pair, presence: true
  validates :name,  presence: true, uniqueness: true
end
  
