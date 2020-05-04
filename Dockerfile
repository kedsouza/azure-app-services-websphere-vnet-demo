#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7


USER root

COPY init.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/init.sh

COPY server.xml /config/server.xml

#ENABLE SSH FUNCTIONALITY
RUN apt-get update && apt-get install -y openssh-server \
     && echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/

EXPOSE $PORT $SSH_PORT

ENTRYPOINT ["init.sh"]

