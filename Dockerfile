FROM centos:8


RUN dnf update -y
RUN dnf install squid -y
RUN dnf install httpd-tools -y

RUN touch /etc/squid/passwd && chown squid /etc/squid/passwd
RUN touch password
RUN echo "pass" > password
RUN echo "pass" >> password
RUN cat password | htpasswd /etc/squid/passwd user

RUN rm /etc/squid/squid.conf
COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

CMD ["squid", "-N"]