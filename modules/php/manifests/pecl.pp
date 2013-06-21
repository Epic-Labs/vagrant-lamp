class php::pecl {
  include php
  # Install xdebug via PECL
  exec { "pecl install xdebug":
    unless => 'pecl list | grep "xdebug"',
    require => [Package['php-pear', 'php5-dev'], Exec['pear upgrade']],
  }
  exec { "pecl install memcache":
    unless => 'pecl list | grep "memcache"',
    require => [Package['php-pear', 'php5-dev'], Exec['pear upgrade']],
  }
  exec { "pecl install apc":
    unless => 'pecl list | grep "apc"',
    require => [Package['php-pear', 'php5-dev'], Exec['pear upgrade']],
  }
}