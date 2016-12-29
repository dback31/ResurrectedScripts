#!/bin/bash
# Specify colors utilized in the terminal
normal='tput sgr0'              # White
red='tput setaf 1'              # Red
green='tput setaf 2'            # Green
yellow='tput setaf 3'           # Yellow
blue='tput setaf 4'             # Blue
violet='tput setaf 5'           # Violet
cyan='tput setaf 6'             # Cyan
white='tput setaf 7'            # White
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold Red
bldgrn=${txtbld}$(tput setaf 2) # Bold Green
bldblu=${txtbld}$(tput setaf 4) # Bold Blue
bldylw=$(txtbld)$(tput setaf 3) # Bold Yellow
bldvlt=${txtbld}$(tput setaf 5) # Bold Violet
bldcya=${txtbld}$(tput setaf 6) # Bold Cyan
bldwht=${txtbld}$(tput setaf 7) # Bold White

clear
        echo -e "${bldred}          ___          ___     "
        echo -e "${bldred}         /  /\        /  /\    "
        echo -e "${bldred}        /  /::\      /  /::\   "
        echo -e "${bldred}       /  /:/\:\    /  /:/\:\  "
        echo -e "${bldred}      /  /:/~/:/   /  /:/~/:/  "
        echo -e "${bldred}     /__/:/ /:/___/__/:/ /:/___"
        echo -e "${bldred}     \  \:\/:::::/\  \:\/:::::/"
        echo -e "${bldred}      \  \::/~~~~  \  \::/~~~~ "
        echo -e "${bldred}       \  \:\       \  \:\     "
        echo -e "${bldred}        \  \:\       \  \:\    "
        echo -e "${bldred}         \__\/        \__\/    "
        echo -e "${bldred}                               "
        echo -e "${bldred}       RESURRECTION REMIX OS   "
        echo -e "${bldred}                               "
        echo -e "${bldred}       M A R S H M A L L O W   "
        echo -e "${bldred}                               "
        echo -e "${bldcya}     Setting up your computer! "

tput setaf 3
	sleep 1
	echo  
	echo Updating Package Lists...
	echo  
	sleep 3
tput setaf 2
	time sudo pacman -Sy && sudo pacman -Syu
	tput setaf 3
	echo  
	echo Installing Yaourt for unofficial Packages...
	echo  
	sleep 3
tput setaf 2
# installing yaourt and dependency package-query
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
tar -xvzf package-query.tar.gz
cd package-query
makepkg -si
# download and install yaourt
cd ..
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
tar -xvzf yaourt.tar.gz
cd yaourt
makepkg -si
# clean up
cd ..
rm -r yaourt
rm -r package-query
rm -r yaourt.tar.gz
rm -r package-query.tar.gz
# yaourt installed
tput setaf 2
	time yaourt -S android-sdk-platform-tools gnupg flex bison gperf git zip pngcrush curl lz4 \
	squashfs-tools schedtool lzop binutils texinfo haskell-yaml coreutils gtkmm3 gtkmm \
	util-linux maven readline lib32-readline liburcu pngquant patch patchutils  \
	libtool automake gawk subversion  bc cloog autoconf pkg-config w3m phablet-tools screen tmux \
	python python-sip python2 python2-appdirs python2-notify python2-packaging python2-protobuf \
	python2-psutil python2-virtualenv sip python2-distutils-extra python2-setuptools \
	ncurses ncurses5-compat-libs lib32-ncurses lib32-ncurses5-compat-libs sdl sdl2 lib32-libtinfo \
	libtinfo wxgtk wxgtk2.8 libcurl-compat zlib perl lib32-zlib libxml++ libxml2 lib32-libxml2 perl-xml-libxml \
	expat lib32-expat libxslt glibc lib32-glibc aarch64-linux-gnu-glibc libconfig \
	gcc-multilib gcc-libs-multilib  webkit2gtk lib32-gcc-libs libvirt glib2 \
	libcap lib32-libcap libgccjit libgmpris libmpc lib32-xz lrzip xz \
	jdk7-openjdk jre7-openjdk jre8-openjdk jdk8-openjdk   
tput setaf 3
	echo  
	echo Settings up USB Ports...
	echo  
	sleep 3
tput setaf 2
	sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/snowdream/51-android/master/51-android.rules
	sudo chmod 644   /etc/udev/rules.d/51-android.rules
	sudo chown root /etc/udev/rules.d/51-android.rules
	sudo service udev restart
	adb kill-server
	sudo killall adb
tput setaf 3
	echo  
	echo Setting up ccache
	echo 
tput setaf 2 	
	git clone https://git.samba.org/ccache.git
	cd ccache
	./autogen.sh
	./configure
	make
	sudo cp -v ./ccache /usr/bin/ccache
	echo "export USE_CCACHE=1" >> ${HOME}/.bashrc
	echo  
tput setaf 3
	echo Downloading repo tool, if already present will update to the latest version...
tput setaf 2
	cd ..
	echo  
	sleep 2
	mkdir -p ~/bin
	PATH=~/bin:$PATH
	curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
	chmod a+x ~/bin/repo
clear
tput setaf 3
	echo  
	echo -e "${bldcya}Your computer is now ready for building! "
	echo  
	sleep 5
tput setaf 2
clear
	echo -e "${bldred}          ___          ___     "
	echo -e "${bldred}         /  /\        /  /\    "
	echo -e "${bldred}        /  /::\      /  /::\   "
	echo -e "${bldred}       /  /:/\:\    /  /:/\:\  "
	echo -e "${bldred}      /  /:/~/:/   /  /:/~/:/  "
	echo -e "${bldred}     /__/:/ /:/___/__/:/ /:/___"
	echo -e "${bldred}     \  \:\/:::::/\  \:\/:::::/"
	echo -e "${bldred}      \  \::/~~~~  \  \::/~~~~ "
	echo -e "${bldred}       \  \:\       \  \:\     "
	echo -e "${bldred}        \  \:\       \  \:\    "
	echo -e "${bldred}         \__\/        \__\/    "
	echo -e "${bldred}                               "
	echo -e "${bldred}       RESURRECTION REMIX OS   "
	echo -e "${bldred}                               "
	echo -e "${bldred}       M A R S H M A L L O W   "
	echo -e "${bldred}                               "
	echo -e "${bldcya}      Downloading Source Code! "
	echo  
	sleep 2
tput setaf 3
	echo -e "${bldcya}Enter the path where source code should be downloaded in full format.\nDefault is ${HOME}/rr"
	read rrpath
tput setaf 2
	mkdir -p $rrpath
	cp build.sh $rrpath/build.sh
	cd $rrpath
	echo  
	repo init -u git://github.com/ResurrectionRemix/platform_manifest.git -b marshmallow
	time repo sync --force-broken --force-sync --no-clone-bundle --quiet
	echo  
	echo  
	echo -e "${bldcya}The RR Source Code has been downloaded into ${rrpath}"
	echo -e "${bldcya}You can now run the build script in ${rrpath}"
	echo -e "${bldcya}Please remember to run ccache -M 40 to set 40gb of ccache, before you start your first build :D" 
	echo -e "${bldcya}This value can be shifted up/down a bit to your liking" 
	cd $rrpath
exit
