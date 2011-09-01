require 'rubygems'
require 'bundler/setup'
require 'parallel'

num_processes = Parallel.processor_count
y = Parallel.map([1,2,3,4,5,6,7,8], :in_processes => num_processes){|x| x+1 }