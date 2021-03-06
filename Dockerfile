FROM jenkinsci/blueocean:1.23.3
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" 

USER root
RUN apk add docker make python3 && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
    chmod +x ./kustomize && \
    mv ./kustomize /usr/local/bin/ && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
