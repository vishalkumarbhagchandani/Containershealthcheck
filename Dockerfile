FROM centos

MAINTAINER  Amitha #name of the creator

#from here to line run postgresql.sh reference from https://stackoverflow.com/questions/34549859/run-a-script-in-dockerfile

RUN su -

RUN if type sudo 2>/dev/null; then \
     echo "The sudo command already exists... Skipping."; \
    else \
     echo -e "#!/bin/sh\n\${@}" > /usr/sbin/sudo; \
     chmod +x /usr/sbin/sudo; \
    fi

RUN mkdir -p /scripts

#postgresql.sh will have steps to install postgresql and sqllite3 inside docker

COPY postgresql.sh /scripts/postgresql.sh 

RUN chmod +x /scripts/postgresql.sh

#RUN ./scripts/postgresql.sh

CMD ["echo", "Hello World"]