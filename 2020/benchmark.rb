#!/usr/bin/env ruby -w 

test_cases = {}

ARGV.each do |arg|
  cmd = arg.strip

  lang, cmd = cmd.split(":", 2).map(&:strip)
  if [lang, cmd].any? { |s| s.nil? }
    puts 'Usage: benchmark lang:"cmd1" lang:"cmd2"'
    exit
  end

  test_cases[lang] = cmd
end

STDERR.puts "Benchmarking:"
STDERR.puts (test_cases.map do |lang, cmd|
  "#{lang}: #{cmd}"
end.join("\nvs\n"))

results = test_cases.map do |key, value|
  [key, []]
end.to_h

def run(cmd)
  t0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  output = `#{cmd}`

  t1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  return [t1 - t0, output]
end

N = 200

test_cases.each do |lang, cmd|
  # Make sure caches are hot
  3.times { run(cmd) }

  N.times do
    results[lang] << run(cmd)
  end
end

report = []

results.each do |lang, result|
  total = result.map(&:first).inject(&:+)
  line = {
    lang: lang,
    total: total,
    avg: total.fdiv(N)
  }

  report << line
end

buf = []

report = report.sort_by { |r| r[:avg] }
best = report.first
buf << "= BenchMarking Results\n\n"
buf << "Over #{N} iterations:\n\n"

buf << "\n\n"

buf << "|===\n"
buf << "|Language|Total(s)|Average(s)|Diff\n\n"

report.each do |data|
  lang = data.fetch(:lang)
  total = data.fetch(:total)
  avg = data.fetch(:avg)

  buf << "| #{lang}: \n"
  buf << "| #{total.round(5)} \n"
  buf << "| #{avg.round(5)} \n"

  if lang != best[:lang]
    buf << "| +#{((avg - best.fetch(:avg))/ best.fetch(:avg) * 100).round(5)}%\n"
  else
    buf << "| - \n"
  end 
  buf << "\n"
end

buf << "|==="

puts buf.join("")