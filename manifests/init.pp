class yum {
    if $custom_yum == "true" {

        exec { 'yum-config-manager --disable base':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "base/"']    
             }

        exec { 'yum-config-manager --disable updates':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "updates/"']    
             }

        exec { 'yum-config-manager --disable extras':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "extras"']    
             }

        exec { 'yum-config-manager --disable centos-sclo-sclo':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "centos-sclo-sclo"']    
             }

        exec { 'yum-config-manager --disable centos-sclo-rh':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "centos-sclo-rh"']    
             }

        exec { 'yum-config-manager --disable epel':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "epel"']    
             }

        exec { 'yum-config-manager --disable foreman-plugins':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "foreman-plugins"']    
             }
        exec { 'yum-config-manager --disable foreman':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "foreman/"']    
             }

        exec { 'yum-config-manager --disable puppet5':
            path  => ['/bin'],
            onlyif => ['yum repolist enabled | grep "puppet5"']    
             }

    if  $custom_centos_base_url != "" {

        file { '/etc/yum.repos.d/custom-centos-base.repo':
            ensure  => 'file',
            content => template("yum/custom-centos-base.erb")
        }
    }

    if  $custom_centos_updates_url != "" {

        file { '/etc/yum.repos.d/custom-centos-updates.repo':
            ensure  => 'file',
            content => template("yum/custom-centos-updates.erb")
        }
    }

    } else { 

        exec { 'yum-config-manager --enable base':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "base/"']    
             }

        exec { 'yum-config-manager --enable updates':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "updates/"']    
             }

        exec { 'yum-config-manager --enable extras':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "extras"']    
             }

        exec { 'yum-config-manager --enable centos-sclo-sclo':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "centos-sclo-sclo"']    
             }

        exec { 'yum-config-manager --enable centos-sclo-rh':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "centos-sclo-rh"']    
             }

        exec { 'yum-config-manager --enable epel':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "epel"']    
             }

        exec { 'yum-config-manager --enable foreman-plugins':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "foreman-plugins"']    
             }

        exec { 'yum-config-manager --enable foreman':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "foreman/"']    
             }

        exec { 'yum-config-manager --enable puppet5':
            path  => ['/bin'],
            unless => ['yum repolist enabled | grep "puppet5"']    
             }
     }
}
