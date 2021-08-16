FROM alpine:3.10 AS downloader
ADD https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/2.14.0/allure-commandline-2.14.0.tgz /opt/allure-2.14.0.tgz
RUN cd /opt && tar zvxf /opt/allure-2.14.0.tgz

FROM jenkinsci/blueocean:1.24.8
LABEL maintainer="v.stone@163.com" \
      organization="Truth & Insurance Office" 

USER root
COPY --from=downloader /opt/allure-2.14.0 /opt/allure-2.14.0
RUN ln -s /opt/allure-2.14.0/bin/allure /usr/bin/allure && \
    apk add docker make python3  subversion && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash && \
    chmod +x ./kustomize && \
    mv ./kustomize /usr/local/bin/ && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
