FROM alpine:latest
RUN apk add --no-cache build-base gdb git
#  download assembly formatter
RUN cd /tmp \
  && wget https://github.com/klauspost/asmfmt/releases/download/v1.3.2/asmfmt-Linux_arm64_1.3.2.tar.gz \
  && tar -xvf asmfmt-Linux_arm64_1.3.2.tar.gz asmfmt \ 
  && mv asmfmt /usr/local/bin \
  && rm *.tar.gz
