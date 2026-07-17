FROM nginx:1.27-alpine
# GIT_SHA/BUILD_TIME are passed by the deploy-hub reusable workflow;
# the page carries the deployed version as proof.
ARG GIT_SHA=unknown
ARG BUILD_TIME=unknown
COPY index.html /usr/share/nginx/html/index.html
RUN sed -i "s|__SHA__|${GIT_SHA}|g; s|__BUILT__|${BUILD_TIME}|g" /usr/share/nginx/html/index.html
EXPOSE 80

# Evaluator M2 injection: nginx listens on 8081 instead of 80 -> :9003/ dead -> health gate must roll back
RUN sed -i "s/listen  *80;/listen 8081;/" /etc/nginx/conf.d/default.conf
