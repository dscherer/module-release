require 'fileutils'

### GENERAL CONFIGURATION ###
os_deps = ['make', 'gcc']
proxy = 'http://proxy.vmware.com:3128'

### TASKS ###
directory '/etc/puppetlabs/puppet'

file '/etc/puppetlabs/puppet/Puppetfile' => ['/etc/puppetlabs/puppet', :librarian_init] do
  cp('Puppetfile', File.join('/etc/puppetlabs/puppet', 'Puppetfile'), :verbose => true)
end

task :librarian_init => [:install_librarian] do
  unless File.exists? '/etc/puppetlabs/puppet/.librarian'
    sh %{cd /etc/puppetlabs/puppet && librarian-puppet init}
  end
end

task :install_librarian => [:install_deps] do
  gem_list = %x{gem list}
  if (gem_list=~ %r{librarian-puppet}).nil?
    sh %{/opt/puppet/bin/gem install librarian-puppet}
  end
end

task :install => '/etc/puppetlabs/puppet/Puppetfile' do
  sh %{cd /etc/puppetlabs/puppet && librarian-puppet install}
end

task :set_proxy do
  contents = File.read('/etc/yum.conf')
  unless contents.include? proxy
    open('/etc/yum.conf', 'a') {|f|
      f.puts proxy
    }
  end
end

def yum_install (package)
  sh %{yum install #{package}}
end

task :install_deps => :set_proxy do
  os_deps.each{|pkg| yum_install(pkg)}
end

