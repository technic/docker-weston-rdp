# fedora has weston-rdp-compositor out of the box
FROM fedora:28

RUN dnf update -y
RUN dnf install -y weston freerdp

RUN useradd -G video -m -s /bin/bash developer
RUN dnf install -y sudo
RUN sudo usermod -aG wheel developer && echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN install -m 700 -o developer -g developer -d /run/user/developer

# Add some usfull tools
RUN dnf install -y gnome-terminal procps-ng psmisc dejavu-sans-mono-fonts vim

USER developer
WORKDIR /home/developer
COPY weston.ini /home/developer/.config/weston.ini

COPY /entrypoint.sh /opt
EXPOSE 3389
ENTRYPOINT ["/opt/entrypoint.sh"]
