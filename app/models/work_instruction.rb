class WorkInstruction < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :workcode, presence: true, length: { maximum: 4 }
  validates :workcode, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  
  has_many :procedure_work_instructions
  has_many :procedures, through: :procedure_work_instructions



end
