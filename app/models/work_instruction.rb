class WorkInstruction < ApplicationRecord
  validates :name, :presence => true
  has_many :procedure_work_instructions
  has_many :procedures, through: :procedure_work_instructions



end
