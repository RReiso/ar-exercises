class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :at_least_one_apparel

  before_destroy :can_be_destroyed?

  private

  def at_least_one_apparel
    return if mens_apparel || womens_apparel
    
    errors.add(:base, "Stores must carry at least one of the men's or women's apparel")
  end

  def can_be_destroyed?
    employees.empty?
  end
end
