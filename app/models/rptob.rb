##############
#            #
#  Remember  #
#  Change=2  #
#            #
##############

require 'legacy'
class Rptob < Legacy
	self.table_name='ML.RPTOBS'
	self.primary_key=:pid	

	belongs_to :person, primary_key: "PID"

    default_scope where("CHANGE=2")

	#WARNING "CHANGE=2" is now part of default scope
	#The effect of this change is not tested in this method
	def self.ever_had(obs)
		where("CHANGE=2").where(hdid: obs).pluck(:pid).uniq
	end

	aspirin_contraindicated=67855
	scope :aspirin_contraindicated, where(hdid: aspirin_contraindicated)

end
