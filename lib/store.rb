class Store < ActiveRecord::Base
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :at_least_one_apparel

  before_destroy :protect_store

  private

  def at_least_one_apparel
    if mens_apparel != true && womens_apparel != true
      errors.add(:mens_apparel, "Stores must carry at least one of the men's or women's apparel")
    end
  end

  def protect_store
    self.employees.empty?
  end
end
