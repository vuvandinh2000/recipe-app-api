#  nginx mac dinh su dung quyen root de chay -> not best practice (security) -> dung unprivileged
#  run nginx tren 1 dir va cap quyen cho no de handle request chi tren dir do
FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="dinhvv.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params
COPY ./run.sh /run.sh

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

#  switch to root user to setup image ready (run below command)
USER root

RUN mkdir -p /vol/static && \
    chmod 755 /vol/static && \
    #  tao file de run.sh copy content vao
    touch /etc/nginx/conf.d/default.conf && \
    chown nginx:nginx /etc/nginx/conf.d/default.conf && \
    chmod +x /run.sh

VOLUME /vol/static

#  switch tro lai user nginx -> la user se chay application
USER nginx

CMD ["/run.sh"]