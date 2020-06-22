FROM jenkinsci/blueocean
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" 

RUN apk add -y docker make python3 
