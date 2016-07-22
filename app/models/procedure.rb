class Procedure < ApplicationRecord
  validates :name, :procedurecode, :presence => true
  validates :procedurecode, uniqueness: { case_sensitive: false }, length: { maximum: 4 }
  has_many :procedure_work_instructions
  has_many :work_instructions, :through => :procedure_work_instructions
  accepts_nested_attributes_for :work_instructions




end
