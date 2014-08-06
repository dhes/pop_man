require 'legacy'
class Person < Legacy
	self.primary_key=:pid
	self.table_name='ML.PERSON'

	has_many :rptobs, foreign_key: "PID"
	has_many :problems, foreign_key: "PID"

	#this method probably should be tested...
	#def self.older_than_so_many_months(months)
#		where('dateofbirth < ?', Time.now-so_many.months)
#	end

	#scope :aspirin_contraindicated, where(lastname: 'Heslinga')
	#aspirin_contraindicated=67855
	#scope :aspirin_contraindicated, where('PID in (select rptobs.PID from rptobs where HDID=?)', 
	#	aspirin_contraindicated)
	def self.aspirin_contraindicated
		joins(:rptobs).where(rptobs: {HDID: 67855})
	end

end