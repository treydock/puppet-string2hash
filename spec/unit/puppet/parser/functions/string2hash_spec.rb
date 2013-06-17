require 'spec_helper'

describe 'the string2hash function' do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it "should exist" do
    Puppet::Parser::Functions.function("string2hash").should == "function_string2hash"
  end

  it 'should raise an ArgumentError if there is less than 1 argument' do
    lambda { scope.function_string2hash([]) }.should( raise_error(ArgumentError))
  end

  it "should convert String to Hash" do
    result = scope.function_string2hash(['{"example":{"set_vhost":"false","domain":"domain.tld","docroot":"/var/www/example.domain.tld/html"}}'])
    result.should(eq({"example"=>{"set_vhost"=>"false","domain"=>"domain.tld","docroot"=>"/var/www/example.domain.tld/html"}}))
  end

  it 'should raise a TypeError if string is not valid JSON' do
    lambda { scope.function_string2hash(['"example",{"set_vhost":"false","domain":"domain.tld","docroot":"/var/www/example.domain.tld/html"}']) }.should( raise_error(TypeError))
  end
end
