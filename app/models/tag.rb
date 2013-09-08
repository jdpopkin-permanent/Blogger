class Tag < ActiveRecord::Base
  attr_accessible :name, :articles
  has_many :taggings
  has_many :articles, through: :taggings

  def to_s
    name
  end
end
