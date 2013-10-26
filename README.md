Prezto
------

This is the prezto module. It installs prezto for a user and changes
their shell to zsh. It has been tested under Ubuntu.  

This module is based on acme/ohmyzsh  

prezto is a community-driven framework for managing your zsh configuration: https://github.com/sorin-ionescu/prezto  

```
class { 'prezto': }
prezto::install { 'username': 
  git_repo => 'git://github.com/baopham/prezto.git',
}
```


License
-------

Apache License, Version 2.0.

