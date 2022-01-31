class Employee < ActiveRecord::Base
  belongs_to :store
  
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, in: 40..200 }
  validates :store, presence: true

  after_create :generate_password

  private

  def generate_password
    self.password = 8.times.map { [*1..9, *'a'..'z', *'A'..'Z'].sample }.join
  end
end
