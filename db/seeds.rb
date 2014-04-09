# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin

puts Dir.pwd
arr_of_arrs = CSV.read("db/chrtrule.csv")
arr_of_arrs.delete_at(0)
sorted = arr_of_arrs.sort{|a,b| a[0]<=>b[0]}
sorted.each do |rule|
	ClinicalRule.create(
    :name => rule[0],
    :sex =>  rule[1],
    :lowage => rule[2].to_i/12,
    :highage => rule[3].to_i/12 ,
    :problem => rule[4],
    :medication => rule[5],
    #:allergy => rule[6],
    :test => rule[6]
    #:comment => rule[8]
	)
end

=end

arr_of_arrs = CSV.read("lib/uspstf_rec.csv".force_encoding('UTF-8').encode('ascii', :undef => :replace, :replace => '?'))
#arr_of_arrs.delete_at(0)
arr_of_arrs.each do |rec|
    UspstfRec.create(
    :topic => rec[0],
    :description =>  rec[1],
    :grade => rec[2],
    :release_date => rec[3]
    )
end

