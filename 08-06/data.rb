include Enumerable
require 'yaml'

data = YAML::load(File.open('widgets.yml'))

print "Most expensive widget: "
max = data.max_by{|hash| hash[:price]}
puts "#{max[:name]} at $ #{max[:price]}\n\n"

print "Least expensive widget: "
min = data.min_by{|hash| hash[:price]}
puts "#{min[:name]} at $ #{min[:price]}\n\n"

print "Total revenue: "
puts "$ #{data.reduce(0){|x, hash| x + hash[:price]}.round(2)}\n\n"

print "Total profit: "
puts "$ #{((data.reduce(0){|x, hash| x + hash[:price]})-(data.reduce(0){|x, hash| x + hash[:cost_to_make]})).round(2)}\n\n"

puts "Top ten best selling widgets: "
best_selling_widgets = data.sort_by{|hash| hash[:sold]}
best_selling_widgets = best_selling_widgets.reverse.first(10)
i = 1
best_selling_widgets.each do |hash|
  puts "#{i} - #{hash[:name]} (#{hash[:sold]} units)"
  i += 1
end

puts "\nDepartments: "
departments = data.group_by{|x| x[:department]}
departments.each do |department, hash|
  number = hash.reduce(0){|x, y| x + y[:sold]}
  puts "#{department} - #{number} widgets sold"
end
