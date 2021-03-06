class Committee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :provinces

  validates :name, length: {minimum: 5}

  has_attached_file :avatar,
                    :styles => { :original =>"400x400>", :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/images/:style/:basename.:extension",
                    :default_url => "/images/:style/brakloga.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def getCommitteesByProvinceId(province_id)
    Committee.joins(:provinces).where('province_id = ?',  province_id)
  end


  end
