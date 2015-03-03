notify { 'info': 
  message => "Hi, I'm a ${::osfamily} system and I have been up for ${::uptime_seconds} seconds.",
}

class { 'rbenv': }
rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.0.0-p598': global => true }