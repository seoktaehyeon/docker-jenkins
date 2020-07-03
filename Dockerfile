FROM jenkinsci/blueocean
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" 

USER root
RUN apk add docker make python python3 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
