class Photo < ActiveRecord::Base
	acts_as_fleximage do
		image_directory 'public/images/uploaded'
		image_storage_format :jpg
		use_creation_date_based_directories true
		
		preprocess_image do |image|
			image.resize '800x600'
		end
	end
	belongs_to :listing
end
