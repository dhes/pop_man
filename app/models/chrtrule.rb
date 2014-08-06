#new
require 'legacy'
class Chrtrule < Legacy

	self.primary_key=:name
	self.table_name='ML.CHRTRULE'

  def self.observation_ids_of_interest
    @chart_rules=Chrtrule.all
    observation_ids_of_interest=[]
    @chart_rules.each do |z|
      z.tests.split('~').each do |y|
       observation_ids_of_interest.push(y.split('|')[0].to_i)
      end
    end
    observation_ids_of_interest
  end

#complicated due to two-tier logic ((intervention1 OR intervention1..) AND (intervention3 OR intervention 4...)...)
  def self.names_and_expanded_observations
    a = Chrtrule.all
    splits_and_expands_on_and = a.map{|z| [z.name.split('^ '), z.tests.split('^ ')]}.
      map{|y| y[0].product(y[1])}.flatten(1)
    names_and_expanded_observations = splits_and_expands_on_and.map{|x| [x[0], x[1].split('~').
      map{|v| Obshead.find(v.split('|')[0]).description}.join(' --OR-- ')]}.sort{|a,b| a[1]<=>b[1]}
  end

#this is a little simpler because of the one-tier logic (prob1 OR prob2 OR...probx)
#it also is different in that it will TRY TO work with the object rather than an array
  def self.split_names_and_expanded_problems
    a = Chrtrule.all
    #split name on ' by ' and problem on '^ '
    splits_and_expands_names_and_problems = a.map{|z| [z.name.split(' by '), z.problems.split('^ ')]}.map{|y| y[0].product(y[1])}.flatten(1)
    names_and_expanded_observations = splits_and_expands_on_and.map{|x| [x[0], x[1].split('~').
      map{|v| Obshead.find(v.split('|')[0]).description}.join(' --OR-- ')]}.sort{|a,b| a[1]<=>b[1]}
  end

  def self.expanded_chrtrules
    gender_choices={'U'=>'All', 'M'=>'Male', 'F'=>'Female'}
    prepend={'-1'=>'Problem of ', '0'=>'Diagnosis of ', '1'=>'Self-limiting problem of ',
      '2'=>'Hospitalized for ', '3'=>'History of ','4'=>'Status post ','5'=>'Rule out ', 
      '6'=>'Question of ', '7'=>'Symptom of ', '8'=>'Risk of ', '9'=>'Take note of ', '10'=>'Family History of '}
    #problem_text_or_code={'0'=> 'Code', '1'=>'Description'}
  	@expanded_probs=[]
  	@chartrules=Chrtrule.all
    #pid_by_panel = DhesPatient.pluck(:pid)
    @chartrules.each do |rule|
      pid_by_age=DhesPatient.between_ages_in_months(rule.lowage, rule.highage).pluck(:pid) #<----------
      if rule.problems 
        rule.problems.split('^ ').each do |problem|
          split_problem=problem.split('|') #<----------
          #population by problem
          pid_by_problem=Problem.is_like(split_problem[2]+'%').pluck(:pid) #<----------
          #note that pid_by_age is on on dhes patient
          pid_denom = pid_by_problem & pid_by_age  
          rule.tests.split('^ ').each do |actions|
            numerator_observation_ids=[]
            pid_for_numer=[]
            how_many_months=0
            interval_or_age=2
            actions.split('~').each do |action|
              split_action=action.split('|')
              numerator_observation_ids.push(split_action[0])
              how_many_months=split_action[1] #action interval/age, parameter ('every' or 'at age') 
                #and +/- for an action are always the same
              interval_or_age=split_action[2].to_i  #1 if interval, 0 if age
              plus_or_minus=split_action[3] #not yet used
            end
#           pid_for_numer=MostRecentObservation.within_the_last_12_months(numerator_observation_ids).pluck(:pid)
            if interval_or_age==1 #interval
              pid_for_numer=MostRecentObservation.within_the_last_so_many_months(numerator_observation_ids, 
                how_many_months).pluck(:pid) #<----------
              pid_numer=pid_for_numer & pid_denom
              @expanded_probs.push(Protocol.new(rule.name.split(' by ')[0], gender_choices[rule.sex], 
                rule.lowage, rule.highage, problem ? prepend[split_problem[0]]+split_problem[2] : '', 
                rule.medications, rule.tests, rule.fact, pid_numer.count, pid_denom.count, nil))
            elsif interval_or_age==0 #age ==> always means 'ever'
              pid_for_numer=Rptob.ever_had(numerator_observation_ids) #<----------pid already plucked in method 
              pid_numer=pid_for_numer & pid_denom
              @expanded_probs.push(Protocol.new(rule.name.split(' by ')[0], gender_choices[rule.sex], 
                rule.lowage, rule.highage, problem ? prepend[split_problem[0]]+split_problem[2] : '', 
                rule.medications, rule.tests, rule.fact, pid_numer.count, pid_denom.count, nil))
            else
              @expanded_probs.push(Protocol.new(rule.name.split(' by ')[0], gender_choices[rule.sex], 
                rule.lowage, rule.highage, problem ? prepend[split_problem[0]]+split_problem[2] : '', 
                rule.medications, rule.tests, rule.fact, 'TROUBLE', pid_denom.count, nil))
            end
          end
        end
      end
      if rule.medications
      end
      if rule.fact
      end
      unless rule.problems || rule.medications ||  rule.fact
        #population by age alone
        pid_count=pid_by_age.count
        @expanded_probs.push(Protocol.new(rule.name.split(' by ')[0], gender_choices[rule.sex], 
          rule.lowage, rule.highage, rule.problems, rule.medications, rule.tests, rule.fact,
          nil, pid_count, nil))
      end      	
    end
    @expanded_probs.sort{|y,z| y.name<=>z.name}
  end

end
