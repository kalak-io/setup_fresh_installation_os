FROM archlinux:latest

COPY scripts/arch.sh /

CMD [ "/bin/bash", "./arch.sh" ]
