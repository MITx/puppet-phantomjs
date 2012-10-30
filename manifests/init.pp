class phantomjs(
    $version = '1.5.0',
    $phantom_bin_path = '/opt/phantomjs',
) {

    if $::architecture == "amd64" or $::architecture == "x86_64" {
        $platid = "x86_64"
    } else {

        case $version {
            '1.4.1', '1.5.0': {
                $platid = 'x86'
            }
            '1.6.0', '1.6.1', '1.7.0': {
                $platid = 'i686'
            }
        }
    }

    case $version {
        '1.4.1', '1.5.0': {
            $extension = 'tar.gz'
            $extract_command = 'xvfz'
        }
        '1.6.0', '1.6.1', '1.7.0': {
            $extension = 'tar.bz2'
            $extract_command = 'xvfj'
        }
    }

    case $version {
        '1.4.1', '1.5.0', '1.6.0', '1.6.1': {
            $variant = '-dynamic'
        }
        '1.7.0': {
            $variant = ''
        }
    }

    $filename = "phantomjs-${version}-linux-${platid}${variant}.${extension}"
    $phantom_src_path = "/usr/local/src/phantomjs-${version}/"

    file { $phantom_src_path : ensure => directory }

    exec { "download-${filename}" : 
        command => "wget http://phantomjs.googlecode.com/files/${filename} -O ${filename}",
        cwd => $phantom_src_path,
        creates => "${phantom_src_path}${filename}",
        require => File[$phantom_src_path]
    }
    
    exec { "extract-${filename}" :
        command     => "tar ${extract_command} ${filename} -C ${phantom_bin_path} --strip-components 1",
        creates     => "/opt/phantomjs/",
        cwd         => $phantom_src_path,
        require     => Exec["download-${filename}"],
    }

    file { "/usr/local/bin/phantomjs" :
        target => "${phantom_bin_path}/bin/phantomjs",
        ensure => link,
        require     => Exec["extract-${filename}"],
    }
    
    file { "/usr/bin/phantomjs" :
        target => "${phantom_bin_path}/bin/phantomjs",
        ensure => link,
        require     => Exec["extract-${filename}"],
    }
    
    exec { "nuke-old-version-on-upgrade" :
        command => "rm -Rf /opt/phantomjs /usr/local/bin/phantomjs",
        unless => "test -f /usr/local/bin/phantomjs && /usr/local/bin/phantomjs --version | grep ${version}",
        before => Exec["download-${filename}"]
    }

}