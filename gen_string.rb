#!/usr/bin/ruby

require 'json'

input_hash = Hash.new

# All items must have double quotes to properly be converted to JSON
	input_hash = {
		"example" => {
			"set_vhost"	=> "false",
			"domain"	=> "domain.tld",
			"docroot"	=> "/var/www/example.domain.tld/html",
		}
	}

puts input_hash.to_json.to_s

