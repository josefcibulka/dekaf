#!/usr/bin/awk -f
BEGIN { replaced=false; }
/^BASEDIR *=/ { 
  if(replaced)
  {
    print $0;
    next;
  }
  print "BASEDIR=" INSTALL_LOCATION;
  replaced=true; 
  next; 
}
// { print $0 }
