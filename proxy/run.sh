#!/bin/sh

set -e  #  neu 1 cau lenh fail thi tat ca fail

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf  #  thay the bien env vao gia tri ${} trong file
#  default.conf.tpl sau do pass vao nginx server at runtime (default dir of default config file of nginx)
nginx -g 'daemon off;'  #  start nginx voi config vua set, daemon off -> run nginx at foreground
#  thong thuong start nginx se run at background -> tuong tac voi no thong qua service manager
#  o day run trong docker container -> phai run o foreground -> everything (log) se show o screen