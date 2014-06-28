require_relative 'scrapp'
def repl(site,tag,limit,api_key)
  @site = site
  @tag  = tag
  @limit = limit
  input = ""
 
  commands = {
    "help" => lambda { |i| print "Options:\nhelp\t\tPrint the help menu\nseturl\t\tSet Tumblr site link\nsettag\t\tSet search tag\nsetlimit\tSet number of posts to display\nrun\t\tRun job\n" },
    "seturl" => lambda {|url| @site = url},
    "settag" => lambda {|tag| @tag = tag},
    "setlimit" => lambda {|limit| @limit = limit},
    "run" => lambda { |i| scrap(@site,@tag,@limit,api_key)},
    "quit" => lambda {|i| exit}
  }
  loop do
    begin
      print "scrap>"
      STDOUT.flush
      input = gets.chomp
      magic=input.split(/\s/)
      print magic
      option = ""
      for opt in 1 ... magic.size
        option = option + magic[opt]+" "
      end
      option = option.rstrip()
      p option
      STDOUT.flush
      if commands.has_key?(magic[0])
        commands[magic[0]].call(option)
      else
        commands["help"].call("")
        STDOUT.flush
      end
    rescue NoMethodError 
      print "\nExiting\n"
      exit
    rescue SystemExit,Interrupt
      print "\nExiting\n"
      exit
    end
  end
end
