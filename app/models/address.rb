class Address < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name, :address1, :city, :state, :zip, :phone
	
	def array
		address = [self.name]
		
		if self.company.present?
			address << self.company
		end
		
		address << self.address1
		
		if self.address2.present?
			address << self.address2
		end
		
		address << self.city
		address << self.state
		address << self.zip
		
		return address
		
	end
	
end
