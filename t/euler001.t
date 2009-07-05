#!/usr/bin/env ruby1.9

basename = File.basename(__FILE__)
dirname = File.dirname(__FILE__)
scripts_dir = File.join(dirname, "..")

euler_id = basename.sub(/\A.*?(\d+).*?\Z/) { $1 }
correct_result = "233168"

scripts = Dir["#{scripts_dir}/euler#{euler_id}*"]

puts "1..#{scripts.length}"
puts "# euler#{euler_id}"
puts "# expected result: #{correct_result}"

def run_script(script_file, expected)
  actual = `#{script_file}`.chomp
  if actual === expected
    yield [true]
  else
    yield [false, actual]
  end
end

i = 1
scripts.each do |script|
  run_script(script, correct_result) do |res|
    case res[0]
    when false
      puts "not ok #{i} - #{script}: got #{res[1]}"
    when true
      puts "ok #{i} - #{script}"
    end
  end
  i += 1
end

