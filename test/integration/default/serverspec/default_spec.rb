require 'serverspec'
require 'net/http'

set :backend, :exec

describe user('deploy') do
  it { should exist }
end

describe user('deploy') do
  it { should belong_to_group 'deploy' }
end

describe file('/home/deploy/.ssh/id_rsa') do
  it { should be_file }
end

describe file('/home/deploy/.ssh/id_rsa.pub') do
  it { should be_file }
end
