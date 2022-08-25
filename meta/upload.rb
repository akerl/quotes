#!/usr/bin/env ruby

bucket = ENV['BUCKET'] || raise('No BUCKET set')

cmd = "madlibrarian upload _build/data.yml '#{bucket}' books"
remote = "_build/meta.yml"
meta = "'s3://#{bucket}/meta/books.yml'"

system("#{cmd} > #{remote}") || raise('Content failed')
system("aws s3 cp #{remote} #{meta}") || raise('Meta failed')
