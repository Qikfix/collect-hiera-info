Hi

This script will collect all the parameters available on puppet classes and will format the output to be used on custom-hiera.yaml

To use.
- Download the code
- Run it
- Will be created the file `/tmp/custom-hiera-params.txt`

The output looks like as below:
```
...
---
File /usr/share/foreman-installer/modules/apache/manifests/mod/passenger.pp
Class name: apache::mod::passenger
-
apache::mod::passenger::manage_repo: true
apache::mod::passenger::mod_id: undef
apache::mod::passenger::mod_lib: undef
apache::mod::passenger::mod_lib_path: undef
apache::mod::passenger::mod_package: undef
apache::mod::passenger::mod_package_ensure: undef
apache::mod::passenger::mod_path: undef
apache::mod::passenger::passenger_allow_encoded_slashes: undef
apache::mod::passenger::passenger_app_env: undef
apache::mod::passenger::passenger_app_group_name: undef
apache::mod::passenger::passenger_app_root: undef
apache::mod::passenger::passenger_app_type: undef
apache::mod::passenger::passenger_base_uri: undef
apache::mod::passenger::passenger_buffer_response: undef
apache::mod::passenger::passenger_buffer_upload: undef
...
apache::mod::passenger::passenger_max_pool_size: undef
apache::mod::passenger::passenger_max_preloader_idle_time: undef
apache::mod::passenger::passenger_max_request_queue_size: undef
apache::mod::passenger::passenger_max_request_time: undef
apache::mod::passenger::passenger_max_requests: undef
apache::mod::passenger::passenger_memory_limit: undef
apache::mod::passenger::passenger_meteor_app_settings: undef
...
---
File /usr/share/foreman-installer/modules/apache/manifests/mod/peruser.pp
Class name: apache::mod::peruser
-
apache::mod::peruser::minspareprocessors: '2'
apache::mod::peruser::minprocessors: '2'
apache::mod::peruser::maxprocessors: '10'
apache::mod::peruser::maxclients: '150'
apache::mod::peruser::maxrequestsperchild: '1000'
apache::mod::peruser::idletimeout: '120'
apache::mod::peruser::expiretimeout: '120'
apache::mod::peruser::keepalive: 'Off'
...
```
