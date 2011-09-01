require 'test_helper'

class ParallelTest < ActiveSupport::TestCase
  test 'a: in process' do
    num_processes = Parallel.processor_count
    y = Parallel.map([1,2,3,4,5], :in_processes => num_processes){|x| x+1 }
    assert_equal y, [2, 3, 4, 5, 6]
  end
  
  test 'b: as a subprocess' do
    cmd = "ruby #{Rails.root}/test/fixtures/parallel_subprocess.rb"
    open("| #{cmd}", "r") do |f|
      until f.eof? do
        c = f.getc or break
        putc (c.is_a?(Fixnum) ? c.chr : c)
      end
    end
    assert true
  end
  
  test 'c: as a subprocess with puts in threads' do
    cmd = "ruby #{Rails.root}/test/fixtures/parallel_subprocess_with_puts_in_threads.rb"
    open("| #{cmd}", "r") do |f|
      until f.eof? do
        c = f.getc or break
        putc (c.is_a?(Fixnum) ? c.chr : c)
      end
    end
    assert true
  end
  
  test 'd: as a subprocess with puts in processes' do
    cmd = "ruby #{Rails.root}/test/fixtures/parallel_subprocess_with_puts_in_processes.rb"
    open("| #{cmd}", "r") do |f|
      until f.eof? do
        c = f.getc or break
        putc (c.is_a?(Fixnum) ? c.chr : c)
      end
    end
    assert true
  end
end
