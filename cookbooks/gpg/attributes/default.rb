#node['gpg']['name']['real'] = "Chef Default"
#node['gpg']['name']['comment'] = "generated by Chef"
#node['gpg']['name']['email'] = "admin@logiflow.com"
#node['gpg']['expire']['date'] = "0"
#node['gpg']['batch_config'] =  "/tmp/gpg_batch_config"
#node['gpg']['key_type'] = "RSA"
#node['gpg']['key_length'] = "2048"  

## It is recommended to use absolute paths for the keyring files, otherwise
## gpg will assume they are located in ~/.gnupg/ 
#node['gpg']['override_default_keyring'] = false
#node['gpg']['pubring_file'] = ""
#node['gpg']['secring_file'] = ""

## run gpg as the following user which will create the keyring in the user's
## $HOME/.gnupg directory (unless keyring files are overridden)
#node['gpg']['user'] = "deploy"