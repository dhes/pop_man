#NOTE -- this loads the ENTIRE problem table
#     -- including with stop dates (stopdate<>end_of_time)
#     -- end change = 0 (never signed) change=1 (changed) change=2 (active)
require 'legacy'
class Problem < Legacy
	#self.table_name='ML.PM_PROBLEMS'
	self.table_name='ML.PROBLEM'
	self.primary_key=:pid
	belongs_to :person, primary_key: "PID"
	def self.is_like(code)
		where("code like ?", code)
	end
	scope :strokes, where("code like ? or code like ?", "ICD-434%", "ICD-435%")								
	scope :signed, where("change <>0")
end
