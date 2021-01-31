FROM python:3-alpine

WORKDIR /app

COPY . .

RUN apk update && apk add --no-cache gcc g++ libffi-dev zlib-dev autoconf automake libtool gcc musl-dev glib-dev eudev-dev libgudev-dev make vala linux-headers udev libusb-dev jpeg-dev

RUN pip install -r requirements.txt && \
    pip install --editable .

ENTRYPOINT ["ckbunker"]
CMD ["run"]
