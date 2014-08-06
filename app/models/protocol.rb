class Protocol
	attr_accessor :name, :sex, :lowage, :highage, :problems, :medications, :tests, :fact, :numer, :denom, :score
	def initialize(name, sex, lowage, highage, problems, medications, tests, fact, numer, denom, score)
		@name=name
		@sex=sex
		@lowage=lowage
		@highage=highage
		@problems=problems
		@medications=medications
		@tests=tests
		@fact=fact
		@numer=numer
		@denom=denom
		@score=score
	end
end
