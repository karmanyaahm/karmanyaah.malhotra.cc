---
author: Karmanyaah
category: Notes
tags: self_hosting nginx
date: 2020-12-17 02:42 -0500
---

Sharing my cgit nginx config with the internet

So recently, I was looking for a way to setup cgit under a subdomain (/git/) using nginx. I was able to find some ways to do this with the static assets under a different directory (for example /cgit/), but I wanted to consolidate it. It's nothing too complicated but here's the configuration I ended up using.

**Nginx Config**
```nginx
server {

    listen 8181 ;
    server_name homenet.malhotra.cc ;

    location /git/ {
        root /usr/share/webapps/cgit;

        location ~ ^/git/(cgit|favicon)\.(ico|png|css)$ {
            try_files /$1.$2 =403;
        }

        include fastcgi_params;
        fastcgi_split_path_info ^(/git)(/.*)$;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param DOCUMENT_ROOT $document_root;
        fastcgi_param SCRIPT_FILENAME $document_root/cgit.cgi;
        fastcgi_pass unix:/run/fcgiwrap.sock;
    }

}
```
**Cgit Config**
```ini
css=/git/cgit.css
logo=/git/cgit.png
favicon=/git/favicon.ico
virtual-root=/git
```



The cgit instance is currently at [homenet.malhotra.cc](http://homenet.malhotra.cc/git/) but will probably move.


The (probably) most recent version can be found on [GitLab](https://gitlab.com/karmanyaahm/infrastructure) (haha still not cgit for my critical stuff yet) 