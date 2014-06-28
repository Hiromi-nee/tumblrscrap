tumblrscrap
===========

Tumblr Photos scrapper

Enter your api key in the var API_KEY in scrap.rb

SCRAP! Tumblr 0.2
```
USAGE: ruby scrap.rb [options]
 -s url     URL of target tumblr blog
 -t tag     Tag
 -l limit   Accepts a number. Number of posts to fetch
 -r         Runs repl environment
```

REPL Usage
```
Options:
help            Print the help menu
seturl          Set Tumblr site link
settag          Set search tag
setlimit        Set number of posts to display
run             Run job
```

- To set target tumblr site
```
scrap>seturl <somesite.tumblr.com>
```

- To set search tag
```
scrap>settag <some tag>
```

- To limit number of search results
```
scrap>setlimit <number>
```