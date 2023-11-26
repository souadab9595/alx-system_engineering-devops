# init.pp

file { '/home/your_username/.ssh/config':
  ensure  => present,
  content => '
    Host your_server
        HostName your_server_ip_or_hostname
        User ubuntu
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
  ',
  mode    => '0600',
  owner   => 'your_username',
  group   => 'your_username',
}
