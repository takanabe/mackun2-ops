# mackun2-ops
A set of operation tools to developing mackun-api &amp; mackun-web


# Usage

```
$ echo "\nHost local.mackun2\n    ForwardAgent yes\n    ServerAliveInterval 60\n    TCPKeepAlive yes\n" >> ~/.ssh/config
$ berks vendor cookbook
$ vagrant init ubuntu14_04  #your ubuntu 14.04 box name
$ vagrant up
$ knife solo cook ec2-user@local.mackun2
```

