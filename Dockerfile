FROM nginx:1.27-alpine
ARG GIT_SHA=unknown
ARG BUILD_TIME=unknown
COPY index.html /usr/share/nginx/html/index.html
COPY brokengate.conf /etc/nginx/conf.d/default.conf
RUN sed -i "s|__SHA__|${GIT_SHA}|g; s|__BUILT__|${BUILD_TIME}|g" /usr/share/nginx/html/index.html
EXPOSE 80
