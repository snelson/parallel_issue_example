require 'rubygems'
require 'bundler/setup'
require 'parallel'

num_threads = Parallel.processor_count
puts "running in #{num_threads} threads"
y = Parallel.map([1,2,3,4,5,6,7,8], :in_threads => num_threads){|x| x+1 }