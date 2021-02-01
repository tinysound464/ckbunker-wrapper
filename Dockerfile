FROM python:3-alpine

RUN apk update

RUN apk add --no-cache autoconf
RUN apk add --no-cache automake
RUN apk add --no-cache eudev-dev
RUN apk add --no-cache g++
RUN apk add --no-cache gcc
RUN apk add --no-cache git
RUN apk add --no-cache glib-dev
RUN apk add --no-cache jpeg-dev
RUN apk add --no-cache libffi-dev
RUN apk add --no-cache libgudev-dev
RUN apk add --no-cache libtool
RUN apk add --no-cache libusb-dev
RUN apk add --no-cache linux-headers
RUN apk add --no-cache make
RUN apk add --no-cache musl-dev
RUN apk add --no-cache udev
RUN apk add --no-cache vala
RUN apk add --no-cache zlib-dev

WORKDIR /
RUN git clone https://github.com/Coldcard/ckbunker.git
WORKDIR ckbunker

RUN pip install -r requirements.txt && \
    pip install --editable .

EXPOSE 9823

ENTRYPOINT ["ckbunker"]
CMD ["run"]
