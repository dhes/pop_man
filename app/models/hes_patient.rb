class HesPatient < ActiveRecord::Base
#	HesPatient.establish_connection(
#		adapter:  "oracle_enhanced",
#		database: "192.168.0.14/Osler",
#		username: "ml",
#		password: "ml",
#)
		self.primary_key=:oracle_id
end
