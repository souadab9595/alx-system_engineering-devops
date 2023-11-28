# File: nginx_setup.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx site
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
    server {
        listen 80;
        server_name _;

        location /redirect_me {
            return 301 http://your-new-page-url; # replace with the actual URL
        }

        location / {
            echo "Hello World!";
        }
    }
  ',
  notify  => Service['nginx'],
}

# Create a symbolic link to enable the site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  notify => Service['nginx'],
}
