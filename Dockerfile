FROM nginx:1.27-alpine
# GIT_SHA/BUILD_TIME are passed by the deploy-hub reusable workflow;
# the page carries the deployed version as proof.
ARG GIT_SHA=unknown
ARG BUILD_TIME=unknown
COPY index.html /usr/share/nginx/html/index.html
RUN sed -i "s|__SHA__|${GIT_SHA}|g; s|__BUILT__|${BUILD_TIME}|g" /usr/share/nginx/html/index.html
EXPOSE 80

# Deliberate breakage for the F4 rollback check: page disappears -> health gate fails
RUN rm -f /usr/share/nginx/html/index.html
