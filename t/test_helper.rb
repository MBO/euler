#!/usr/bin/env ruby1.9

require "yaml"

def extract_id_from_testname(testname)
  File.basename(testname).sub(/\A.*?(\d+).*?\Z/) { $1 }
end

def scripts(euler_id)
  scripts_dir = File.join(File.dirname(__FILE__), "..")
  Dir["#{scripts_dir}/euler#{euler_id}*"]
end

def scripts_from_testname(testname)
  scripts(extract_id_from_testname(testname))
end

def expected_result(euler_id)
  yaml = nil
  results = File.join(File.dirname(__FILE__), "results.yml")
  File.open(results) do |file|
    yaml = YAML::load(file)
  end

  yaml[euler_id]
end

def expected_result_for_testname(testname)
  expected_result(extract_id_from_testname(testname))
end

def run_scripts(scripts, expected)
  puts "1..#{scripts.length}"
  puts "# expected result: #{expected}"

  i = 0
  scripts.each do |script|
    i += 1
    run_script(script, expected) do |res|
      case res[0]
      when false
        puts "not ok #{i} - #{script}: incorrect result"
        puts "# #{res[1].gsub(/\n/m, "\n# ")}"
      when true
        puts "ok #{i} - #{script}"
      end
    end
  end
end

def run_script(script_file, expected)
  actual = `#{script_file}`.chomp
  if actual === expected
    yield [true]
  else
    yield [false, actual]
  end
end

def run_scripts_for_testname(testname)
  test_id = extract_id_from_testname(testname)

  scripts = scripts(test_id)
  expected = expected_result(test_id)
  run_scripts(scripts, expected)
end
