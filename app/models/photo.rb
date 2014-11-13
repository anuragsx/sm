class Photo < ActiveRecord::Base
  #attr_accessor :image_file_name
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
=begin
	acts_as_fleximage do
		image_directory 'public/images/uploaded'
		image_storage_format :jpg
		use_creation_date_based_directories true
		
		preprocess_image do |image|
			image.resize '800x600'
		end
  end
=end
	belongs_to :listing
end
