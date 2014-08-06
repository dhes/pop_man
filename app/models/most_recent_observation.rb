require 'legacy'
class MostRecentObservation < Legacy
	self.table_name='ML.PM_MOST_RECENT_OBS'

	def self.observations_of_interest
		@observations_of_interest=MostRecentObservation.where(hdid: Chrtrule.observation_ids_of_interest)
	end

	def self.by_observation(obs)
		@by_observation=MostRecentObservation.where(hdid: obs)
	end

	def self.within_the_last_12_months(obs)
		@within_the_last_12_months=MostRecentObservation.where(hdid: obs).where("obsdate > ?", Time.now - 12.months)
	end

	def self.within_the_last_so_many_months(obs, so_many)
		@within_the_last_12_months=MostRecentObservation.where(hdid: obs).where("obsdate > ?", Time.now - so_many.
			to_i.months)
	end

end
