node default {
  include vector
  include vector::pcp

  include ufw

  ufw::allow { 'ssh':
    port => '22'
  }
}
