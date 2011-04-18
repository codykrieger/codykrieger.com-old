# Installing

This assumes:
- you have RVM installed
- you're using either Ruby 1.9.2 or REE
- you're running Nginx and Passenger

## Initial setup
    
    cd ~
    git clone git://github.com/codykrieger/codykrieger.com
    cd codykrieger.com
    
    [trust the .rvmrc]
    gem install bundler && bundle install
    
    # for downloads
    mkdir storage

## Nginx Configuration

nginx.conf:
    
    events {
        worker_connections  1024;
        accept_mutex on;
        
        # uncomment these based on which OS you're on
        # use epoll; # for linux 2.6+
        # use kqueue; # for freebsd, os x
    }
    
    http {
        # from rvmsudo passenger-install-nginx-module
        passenger_root ...;
        passenger_ruby ...;
    
        passenger_max_pool_size 3;
        rails_spawn_method smart;

        include       mime.types;
        default_type  application/octet-stream;

        sendfile       on;
        tcp_nopush     on;
        tcp_nodelay    on;

        keepalive_timeout  60 60;
        send_timeout 60;                                 

        gzip  on;
        gzip_buffers 16 8k;
        gzip_disable "MSIE [1-6]\.";
        gzip_comp_level 9;
        gzip_http_version 1.0;
        gzip_min_length 640;
        gzip_types text/plain text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript;
        gzip_vary on;
    
        # other server blocks, etc.
    
        server {
            listen [::]:80;
        
            server_name www.codykrieger.com codykrieger.com;
            root /home/[user]/codykrieger.com/public;
            include passenger.standard.conf;

            location /storage {
                root /home/[user]/codykrieger.com;
                internal;
            }
        }
        
        # other server blocks, etc.

    }

passenger.standard.conf:

    passenger_enabled on;
    passenger_use_global_queue on;
    rails_env production;
    
    # comment this section out if you like having a www
    if ($host ~* ^www\.(.*)) {
        set $remove_www $1;
        rewrite ^(.*)$ http://$remove_www$1 permanent;
    }

    location ~* ^.+.(ico|css|js|gif|jpe?g|png)(.)?([0-9]+)?$ {
        passenger_enabled on;
        passenger_use_global_queue on;
        expires max;
    }

    location ~ ^/assets/ {
        passenger_enabled on;
        passenger_use_global_queue on;
        expires max;
    }
