#!/usr/bin/env ruby

require 'yaml'
require 'fileutils'

FileUtils.mkdir_p('_build')

books = Dir.glob('*/meta.yml').map do |x|
  dir = File.dirname(x)
  YAML.safe_load(File.read(x))['books'].keys.map { |y| File.join(dir, y) }
end.flatten

quotes = books.map { |x| File.readlines(x).map(&:rstrip) }.flatten

File.open('_build/data.yml', 'w') do |fh|
  fh << YAML.dump('data' => { 'quote' => quotes })
end
