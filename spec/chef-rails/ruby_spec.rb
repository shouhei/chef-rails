require 'spec_helper'

# rbenv group
describe group('rbenv') do
  it { should exist }
end

describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'rbenv' }
end

# install rbenv
describe command('source /etc/profile.d/rbenv.sh; which rbenv') do
  let(:disable_sudo) { true }
  it { should return_stdout('/usr/local/rbenv/bin/rbenv') }
end

# rbenv.sh
describe file('/etc/profile.d/rbenv.sh') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match(/^export RBENV_ROOT="\/usr\/local\/rbenv"$/) }
  its(:content) { should match(/^export PATH="\$RBENV_ROOT\/bin:\$PATH"$/) }
  its(:content) { should match(/^eval "\$\(rbenv init -\)"$/) }
end

# ruby-build
describe file('/usr/local/rbenv/plugins') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'rbenv' }
  it { should be_mode 755 }
end

describe file('/usr/local/rbenv/plugins/ruby-build/.git/') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'rbenv' }
  it { should be_mode 755 }
end

# install ruby
['2.1.2', '2.0.0-p247'].each do |ruby_version|
  describe command("source /etc/profile.d/rbenv.sh; rbenv versions | grep #{ruby_version}") do
    let(:disable_sudo) { true }
    its(:stdout) { should match(/#{Regexp.escape(ruby_version)}/) }
  end
end

describe command('source /etc/profile.d/rbenv.sh; rbenv global') do
  let(:disable_sudo) { true }
  it { should return_stdout('2.1.2') }
end

