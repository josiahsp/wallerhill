class Music < ActiveRecord::Base

	has_and_belongs_to_many :composers, join_table: "musics_composers"
	has_many :tracks
	
	has_attached_file :artwork, styles: { large: "900x809", medium: "185x166>", thumb: "120x108>" }, default_url: "/images/:style/missing.jpg"
	validates_attachment_content_type :artwork, content_type: /\Aimage\/.*\Z/
	
	validates_presence_of :title, :description, :released
	validates_uniqueness_of :title


end
