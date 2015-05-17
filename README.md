# Portal Crawler
Notify the subject by contact of KIT student portal to Slack  

## Usage
Slack notification:

	$ rake slack
	
## Install
Clone this repository:

	$ git clone git://github.com/UTF-9/portal-crawler.git
	
or click this URL  

https://github.com/UTF-9/portal-crawler/archive/master.zip
	
Install gems:

	$ bundle install

Write configuration in `config.yml`:

~~~yaml
portal:
  id: student ID
  pass: portal passworld

library:
  id: library ID
  pass: library password

slack:
  token: slack token
  room: room name(Do not put a "#")
~~~

## Requirement
* Ruby 2.2.0 or Later
* rake  10.0 or Later

## Future implementations
* Twitter support
* Automatic download of material
* And more...

## License
Released under the [MIT Licence](https://github.com/UTF-9/portal-crawler/blob/master/LICENCE)
