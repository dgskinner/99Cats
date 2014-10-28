class Cat < ActiveRecord::Base
  SEXES = ["M", "F"]
  COLORS = ["white","black", "grey", "brown", "orange"]
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :sex, inclusion: { in: SEXES }
  validates :color, inclusion: { in: COLORS }
  validates_date :birth_date, :on_or_before => lambda { Date.current }
  
  def age
    (Date.current - birth_date).to_i / 365
  end
end
