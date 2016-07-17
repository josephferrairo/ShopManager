class Procedure < ApplicationRecord
  validates :name, :presence => true
  has_many :procedure_work_instructions
  has_many :work_instructions, :through => :procedure_work_instructions
  accepts_nested_attributes_for :work_instructions


end
