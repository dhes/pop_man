require 'legacy'
class DiabetesPatient < Legacy
	
		self.primary_key=:oracle_id
		self.table_name='ML.DIABETES_PATIENTS'

end
