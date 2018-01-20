class Song < ActiveRecord::Base
	validates :title, presence: true, uniqueness: {scope: :release_year}
	validates :released, inclusion: {in: [true, false]}
	validates :artist_name, presence: true
	validate :release_year_is_reasonable

	def release_year_is_reasonable
		if released && !release_year
			errors.add(:release_year, 'shoudl exist for released song')			
		elsif release_year && release_year > Time.now.year
			errors.add(:release_year, 'should not be in the future')
		end
	end

end
