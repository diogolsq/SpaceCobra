File.foreach('test.txt').with_index do |line, line_num|
  puts "#{line}"
end
