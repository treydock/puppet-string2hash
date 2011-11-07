#!/usr/bin/ruby

module Puppet::Parser::Functions
	newfunction(:string2hash, :type => :rvalue) do |args|
		raise ArgumentError, ("string2hash(): wrong number of arguments (#{args.length}; must be 1)") if args.length != 1
		#raise ArgumentError, ("string2hash(): wrong type of argument (#{args[0].kind_of}; must be string)") if args[0].kind_of? String

		require 'json'

		begin
			return JSON.parse(args[0])
		rescue Exception => exc 
			raise TypeError, "string2hash(): error converting string to hash"
		end
		
	end
end
