FROM jenkinsci/blueocean
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" 

USER root
RUN apk add docker make python 
