FROM l3iggs/archlinux
MAINTAINER Nikos Mouchtaris <nikos@azavista.com>

RUN printf 'Server = http://ftp.nluug.nl/os/Linux/distr/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm --needed base
RUN pacman -S --noconfirm --needed base-devel
RUN pacman -S --noconfirm --needed ffmpeg
RUN pacman -S --noconfirm --needed fish
RUN pacman -S --noconfirm --needed jdk8-openjdk
RUN pacman -S --noconfirm --needed libwebp
RUN pacman -S --noconfirm --needed libxtst
RUN pacman -S --noconfirm --needed libxtst
RUN pacman -S --noconfirm --needed openssh
RUN pacman -S --noconfirm --needed pkgfile
RUN pacman -S --noconfirm --needed pygtk
RUN pacman -S --noconfirm --needed python2
RUN pacman -S --noconfirm --needed python2-imaging
RUN pacman -S --noconfirm --needed sudo
RUN pacman -S --noconfirm --needed vim
RUN pacman -S --noconfirm --needed x264
RUN pacman -S --noconfirm --needed xf86-video-dummy
RUN pacman -S --noconfirm --needed xorg
RUN pacman -S --noconfirm --needed xorg-server-xvfb
RUN pacman -Ssq ttf- | xargs pacman -S --noconfirm --needed
RUN pkgfile --update

RUN mkdir -pv /local
RUN curl https://aur.archlinux.org/packages/xp/xpra-winswitch/xpra-winswitch.tar.gz > /local/xpra.tar.gz

RUN ssh-keygen -t rsa -N '' -C '' -f /etc/ssh/ssh_host_rsa_key
RUN sed -i -r -e 's/^\s*#?\s*(UsePAM).*$/\1 no/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11Forwarding).*$/\1 yes/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11UseLocalhost).*$/\1 yes/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/^\s*#?\s*(X11DisplayOffset).*$/\1 10/' /etc/ssh/sshd_config
RUN sed -i -r -e 's/.*\%wheel\s+ALL=\(ALL\).*/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers

RUN groupadd sudo
RUN useradd -G sudo,wheel -m nikos
USER nikos
WORKDIR /local/nikos

ENV _JAVA_OPTIONS -Dawt.useSystemAAFontSettings=lcd
ENV JAVA_FONTS /usr/share/fonts/TTF/
ENV EDITOR vim

RUN sudo mkdir -pv /local/nikos/tmp
RUN sudo chown -Rv nikos:nikos /local/nikos
RUN true \
    && mkdir -pv tmp/xpra \
    && cd tmp/xpra \
    && tar xvf /local/xpra.tar.gz \
    && cd * \
    && printf '#!/bin/bash\n\npacman --noconfirm $@\n' | tee pakpak \
    && chmod 700 pakpak \
    && env PACMAN=$(pwd)/pakpak makepkg -s
RUN sudo pacman -Syu
RUN true \
    && cd tmp/xpra/* \
    && echo xpra-winswitch-*.tar.xz \
    && ls -al /var/lib/pacman \
    && sync \
    && sudo pacman --noconfirm -U xpra-winswitch-*.tar.xz
RUN rm -rv tmp/xpra

ADD ideaIU-14.1.3.tar.gz .
RUN sudo chown -R -v nikos:nikos .

RUN printf 'nikos:2\n' | sudo chpasswd
EXPOSE 22
CMD sudo /usr/sbin/sshd -D

