#new
require 'legacy'
class Chrtrule < Legacy

	self.primary_key=:name
	self.table_name='ML.CHRTRULE'

  def self.names_and_expanded_observations
    a = Chrtrule.all
    splits_and_expands_on_and = a.map{|z| [z.name.split('^ '), z.tests.split('^ ')]}.
      map{|y| y[0].product(y[1])}.flatten(1)
    names_and_expanded_observations = splits_and_expands_on_and.map{|x| [x[0], x[1].split('~').
      map{|v| Obshead.find(v.split('|')[0]).description}.join(' --OR-- ')]}.sort
  end

#will do by hand instead of this...
#	def to_model
#    ::Chrtrule.new do |c|
#      c.name = self.Description
#    end
#  end

end
