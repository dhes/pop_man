require 'legacy'
class DhesPatient < Legacy
	self.table_name='ML.DHES_PATIENTS'
	self.primary_key=:pid
	def self.older_than_?(months)
		where("age_months >= ?", months)
	end
	def self.between_ages_in_months(low, high )
		where("age_months >= ? and age_months < ?", low, high)
	end
end

#end