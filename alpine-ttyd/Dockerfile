#
#
FROM alpine:latest

LABEL maintainer="darryl.west" version="22.2.25"

RUN apk update && apk upgrade && apk add --no-cache which bash jq curl neovim ttyd

# add the profile?

EXPOSE 7681

CMD ["ttyd", "bash", "-l"]

