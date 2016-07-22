class WorkInstruction < ApplicationRecord
  validates :name, :description, :workcode, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :workcode, uniqueness: { case_sensitive: false }, length: { maximum: 4 }
  has_many :procedure_work_instructions
  has_many :procedures, through: :procedure_work_instructions
end
