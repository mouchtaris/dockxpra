FROM l3iggs/archlinux
MAINTAINER Nikos Mouchtaris <nikos@azavista.com>

RUN printf 'Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm base
RUN pacman -S --noconfirm base-devel
RUN pacman -S --noconfirm fish
RUN pacman -S --noconfirm jdk8-openjdk
RUN pacman -S --noconfirm libxtst
RUN pacman -S --noconfirm openssh
RUN pacman -S --noconfirm pkgfile
RUN pacman -S --noconfirm sudo
RUN pacman -S --noconfirm vim
RUN pacman -S --noconfirm xorg
RUN pacman -Ssq ttf- | xargs pacman -S --noconfirm --needed
RUN pkgfile --update
RUN ssh-keygen -t rsa -N '' -C '' -f /etc/ssh/ssh_host_rsa_key
RUN sed -i -r -e 's/^\s*#?\s*(UsePAM).*$/\1 no/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11Forwarding).*$/\1 yes/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11UseLocalhost).*$/\1 yes/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11DisplayOffset).*$/\1 10/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/.*\%wheel\s+ALL=\(ALL\).*/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

RUN groupadd sudo
RUN useradd -G sudo,wheel -m nikos
USER nikos
WORKDIR /home/nikos

RUN printf '\n\n%s' 'export _JAVA_OPTIONS=-Dawt.useSystemAAFontSettings=lcd' | tee -a $HOME/.bashrc
RUN printf '\n%s' 'export JAVA_FONTS=/usr/share/fonts/TTF/' | tee -a $HOME/.bashrc
RUN printf '\n%s' 'export EDITOR=vim' | tee -a $HOME/.bashrc

RUN curl https://aur.archlinux.org/packages/xp/xpra-winswitch/xpra-winswitch.tar.gz > xpra.tar.gz
RUN true \
    && mkdir -pv /tmp/xpra \
    && cd /tmp/xpra \
    && tar xvf ~/xpra.tar.gz \
    && cd * \
    && printf '#!/bin/bash\n\npacman --noconfirm $@\n' | tee pakpak \
    && chmod 700 pakpak \
    && env PACMAN=$(pwd)/pakpak makepkg -s
RUN sudo pacman -Syu
RUN true \
    && cd /tmp/xpra/* \
    && echo xpra-winswitch-*.tar.xz \
    && ls -al /var/lib/pacman \
    && sync \
    && sudo pacman --noconfirm -U xpra-winswitch-*.tar.xz
RUN rm -rv /tmp/xpra

ADD ideaIU-14.1.3.tar.gz /home/nikos

RUN printf 'nikos:2\n' | sudo chpasswd
EXPOSE 22
CMD sudo /usr/sbin/sshd -D

