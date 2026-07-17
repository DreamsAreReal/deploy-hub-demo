# deploy-hub-demo

A one-page static site that proves its own deployment: the git sha and build
time are baked into the HTML at docker build time (via build-args passed by
the deploy-hub workflow). If the sha on the page equals the repo HEAD, the
deployed version is exactly that commit. Serves as the second pilot app of
[deploy-hub](https://github.com/DreamsAreReal/deploy-hub).
