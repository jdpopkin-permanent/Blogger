class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :tags
  #attr_accessor :tags
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags ||= []
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_by_name(name) || Tag.create(:name => name) }
    self.tags = new_or_found_tags || []
  end
end
