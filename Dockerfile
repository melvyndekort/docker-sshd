FROM alpine:3.4

RUN apk add --update --no-cache bash openssh && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config

ADD authorized_keys /root/.ssh/
RUN chmod 600 /root/.ssh/authorized_keys

ADD entry.sh /
RUN chmod 755 /entry.sh

EXPOSE 22

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
