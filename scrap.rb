require 'optparse'
require_relative 'lib/repl'
require_relative 'lib/scrapp'
Version = "0.2"
API_KEY = 'YOURAPIKEYHERE'
@tag="hikasa youko"
@site="sei.neesan.org"
@limit="1"

params = ARGV.getopts('s:t:l:rh')
p params
if params['h']
  print "SCRAP! Tumblr " + Version + "\n"
  print "USAGE: ruby scrap.rb [options]\n"
  print " -s url \tURL of target tumblr blog\n"
  print " -t tag \tTag\n"
  print " -l limit \tAccepts a number. Number of posts to fetch\n"
  print " -r \t\tRuns repl environment\n"
  exit
elsif params['r']
  repl(@site,@tag,@limit,API_KEY)
  exit
elsif params['s'] && params['t']
  @site = params['s']
  @tag = params['t']
  params['l'] ? @limit = params['l'] : @limit ="1"
else
  print "Run \"ruby scrap.rb -h\" for help and more options.\n"
  exit
end


#scrapping code

#default
scrap(@site,@tag,@limit,API_KEY)


