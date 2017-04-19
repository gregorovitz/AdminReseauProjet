FROM ubuntu:latest 
ENV DEBIAN_FRONTEND noninteractive 
RUN apt-get update -qq && apt-get install -y postfix dovecot-imapd dovecot-pop3d runit -qq
RUN rm -rf /etc/sv/getty-5

RUN echo "protocols = imap pop3" >> /etc/dovecot/dovecot.conf
RUN echo "mail_location = maildir:~/Maildir" >> /etc/dovecot/dovecot.conf
//RUN echo -e "smtpd_sasl_auth_enable = yes\nsmtpd_sasl_type = dovecot\nsmtpd_sasl_path = private/auth\nsmtpd_recipient_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination" >> /etc/postfix/main.cf

ADD 10-postfix-listener.conf /etc/dovecot/conf.d/

#voici ce que j'ai trouvé et que je pense être sur
