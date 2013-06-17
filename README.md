# puppet-string2hash [![Build Status](https://travis-ci.org/treydock/puppet-string2hash.png)](https://travis-ci.org/treydock/puppet-string2hash)

This puppet function converts a JSON formatted string into a Puppet hash.  This allows the string to be passed into a define from the ENC.

This relies on the use of the create_resources function.  This is built in as of 2.7.x.

This was created entirely with Foreman in mind and that's all I have tested it with.

# Install #

To install you need to place the directory string2hash in your Puppet modulepath

```bash
cd /path/to/your/modulepath

git checkout https://github.com/treydock/puppet-string2hash string2hash
```

# Usage #

This was designed to work with Foreman, so the usage may need to be adjusted slightly depending how your ENC handles strings.

This example of the JSON string I add to Foreman for the parameter $wordpress_instance

```ruby
{"example":{"set_vhost":"false","domain":"domain.tld","docroot":"/var/www/example.domain.tld/html"}}
```

This is what is actually passed to Puppet in the YAML is a correclyted escaped JSON string

```ruby
wordpress_instances: "{\"example\":{\"set_vhost\":\"false\",\"domain\":\"domain.tld\",\"docroot\":\"/var/www/example.domain.tld/html\"}}"
```

If you were to define this parameter in Puppet it would look like this

```ruby
$wordpress_instance = {
	'example'	=> {
		set_vhost	=> false,
		domain		=> 'domain.tld',
		docroot		=> '/var/www/example.domain.tld/html',
	},
}
```

## Helper function ##

I've included the helper function gen_string.rb to aid in converting puppet hashes into JSON strings

NOTE: All items in the must be encapsulated in double quotes

To use, edit the value of input_hash to reflect your Puppet hash, then run the script

```bash
ruby ./gen_string.rb
```

