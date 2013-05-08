# simplify github module convention
def github(name, options = nil)
  options ||= {}
  options[:user]     ||= 'puppetlabs'
  options[:version]  ||= :master
  options[:protocol] ||= 'git'
  options[:prefix]   ||= case options[:user]
    when 'puppetlabs'
      'puppetlabs'
    when 'VMop', 'vmware'
      'vmware'
    else
      'puppet'
    end
  options[:repo] ||= case options[:protocol]
    when 'git'
      "#{options[:protocol]}@github.com:#{options[:user]}/#{options[:prefix]}-#{name}.git"
    when 'https'
      "#{options[:protocol]}://github.com/#{options[:user]}/#{options[:prefix]}-#{name}.git"
    else
      raise Error, "Invalid github repo protocol."
    end

  if options[:version] == :master
    puts name, options[:repo]
    mod name, :git => options[:repo], :ref => :master
  else
    puts name, options[:repo], options[:version]
    mod name, :git => options[:repo] , :ref => options[:version]
  end
end

# Puppet Labs modules
github 'stdlib',     :version => '3.2.0'
github 'mongodb',    :version => '0.1.0'
github 'nodejs',     :version => '0.3.1'
github 'ntp',        :version => '0.3.0'
github 'pe_gem',     :version => '0.0.1'
github 'postgresql', :version => '2.2.1', :prefix => 'puppet'
github 'ruby',       :version => '0.0.2'
github 'tftp',       :version => '0.2.0'
github 'vcsrepo',    :version => '0.1.1'
github 'xinetd',     :version => '1.1.0'

# External modules
github 'concat',     :user => 'ripienaar'
github 'staging',    :user => 'nanliu',      :version => '0.3.0'
github 'sudo',       :user => 'saz',         :version => 'v2.2.0'
github 'pe_upgrade', :user => 'adrienthebo', :version => '0.4.1'

# VMware modules
github 'vmware_lib', :user => 'vmware'
github 'vcsa',       :user => 'vmware'
github 'vshield',    :user => 'vmware'
# TODO, fix version:
#github 'vcenter', :user => 'vmware'

# VMop modules
github 'cassandra', :user => 'VMop'
github 'git',       :user => 'VMop'
github 'java',      :user => 'VMop'
github 'jruby',     :user => 'VMop'
github 'ovftool',   :user => 'VMop'
github 'profile',   :user => 'VMop'
github 'razor',     :user => 'VMop'
github 'rabbitmq',  :user => 'VMop'
github 'vcd',       :user => 'VMop'
github 'pe_mcollective', :user => 'VMop', :prefix => 'puppet'

# Very temporary
github 'dhcp', :user => 'nanliu', :version => 'host_template', :prefix => 'puppetlabs'
