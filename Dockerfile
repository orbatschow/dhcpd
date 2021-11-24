FROM alpine:3.14.3

LABEL maintainer="Nils Orbat"

RUN apk --no-cache add dhcp

VOLUME ["/var/lib/dhcp", "/etc/dhcp"]

# Ensure lease db exists
RUN touch /var/lib/dhcp/dhcpd.leases

ENTRYPOINT ["/usr/sbin/dhcpd"]

CMD ["-4", "-d", "-user", "dhcp", "-group", "dhcp"]
