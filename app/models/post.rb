class Post < ActiveRecord::Base
has_and_belongs_to_many :tags
validates :text, presence: true


def self.tagged_with(name)
  Tag.find_by_name!(name).posts
end

def tag_list
    self.tags.map {|t| t.name }.join(" ")
end

def tag_list=(tag_list)
  tags = tag_list.split(" ").map{|n| n.strip.downcase}
  tags.each do |tag_name|
    tag = Tag.find_or_create_by_name!(name: tag_name)
    tag.name = tag_name
    self.tags << tag
  end
end







end
