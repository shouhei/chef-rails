default['mysql']['version'] = "5.6.21-1"
default['mysql']['subject']   = "#{default['mysql']['version']}.el6.x86_64"
default['mysql']['file_name']  = "MySQL-#{default['mysql']['subject']}.rpm-bundle.tar"
default['mysql']['remote_uri'] = "http://ftp.jaist.ac.jp/pub/mysql/Downloads/MySQL-5.6/MySQL-#{default['mysql']['subject']}.rpm-bundle.tar"
default['mysql']['rpms'] = [
  {
    :rpm_file     => "MySQL-client-#{default['mysql']['subject']}.rpm",
    :package_name => "mysql-client"
  },
  {
    :rpm_file     => "MySQL-devel-#{default['mysql']['subject']}.rpm",
    :package_name => "mysql-devel"
  },
  {
    :rpm_file     => "MySQL-shared-#{default['mysql']['subject']}.rpm",
    :package_name => "mysql-shared"
  },
  {
    :rpm_file     => "MySQL-server-#{default['mysql']['subject']}.rpm",
    :package_name => "mysql-server"
  }

]
