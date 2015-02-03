class Committee < ActiveRecord::Base
 belongs_to :province
  has_many :votes
  belongs_to :user

  validates :name, length: {minimum: 5}

  has_attached_file :avatar,
                    :styles => { :original =>"400x400>", :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/images/:attachment/:style/:basename.:extension",
                    :default_url => "/images/:attachment/:style/brakloga.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end