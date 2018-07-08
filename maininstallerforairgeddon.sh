#!/bin/bash
# Main installer script to all necessary dependencies for airgeddon
# Tested on Ubuntu 16.04 and Linux Mint 18.3
#
# Copyright (c) 2018 SecurityObesity
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function installerAdditionalTools()
{
	`sudo apt-get install aircrack-ng sslstrip xterm iw gawk isc-dhcp-server lighttpd crunch dsniff hostapd expect-dev expect curl git wireless-tools net-tools nodejs autoconf automake openssl sqlite3 subversion`
}

function installerLibraries()
{
	`sudo apt-get install build-essential libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev libxml2-dev libxslt1-dev libc6-dev libncurses5-dev libtool bison libpcap-dev`
}

function installerBettercap()
{
	`sudo gem install bettercap`
}

function installerEttercap()
{
	`sudo apt-get install ettercap-graphical ettercap-common`
	`sudo apt-get install ettercap-text-only`
}

function installerPixiewps()
{
	`git clone https://github.com/wiire/pixiewps.git`
	`cd pixiewps/`
	`make`
	`sudo make install`
	`cd ..`
	`rm -rf pixiewps/`
}

function updateRuby()
{
	`sudo apt-get install ruby ruby-dev`
	`sudo gem update --system`
}

function installerBeEF()
{
	`sudo gem install rubocop`
	`git clone https://github.com/beefproject/beef`
	`cd beef/`
	`echo "gem 'xmlrpc'" >> Gemfile`
	`sudo ./install`
	`cd ..`
	`sudo mkdir -p /opt/beef/`
	`sudo cp -r beef/* /opt/beef/`
	`echo -e '#!/bin/bash\ncd /opt/beef/\n/opt/beef/beef "$@"' > ./beef && sudo mv ./beef /bin/beef && sudo chmod +x /bin/beef`
	`rm -rf beef/`
}

function installerBully()
{
	`git clone https://github.com/wiire-a/bully`
	`cd bully/src/`
	`make`
	`sudo make install`
	`cd ../../`
	`sudo rm -rf bully/`
}

function installerHashcat()
{
	`git clone https://github.com/hashcat/hashcat`
	`cd hashcat/`
	`git submodule update --init`
	`make`
	`sudo make install`
	`cd ..`
	`sudo rm -rf hashcat/`
}

function installermdk3wifi()
{
	`git clone https://github.com/wi-fi-analyzer/mdk3-master`
	`cd mdk3-master/`
	`make`
	`sudo make install`
	`cd ..`
	`sudo rm -rf mdk3-master/`
}

function installerReaver()
{
	`sudo apt-get install reaver`
}

function installerAirgeddonTools()
{
	`git clone https://github.com/v1s1t0r1sh3r3/airgeddon`
	`cd airgeddon/`
	`chmod a+x airgeddon.sh`
}

function maininit()
{
	installerLibraries()
	installerAdditionalTools()
	updateRuby()
	installerBeEF()
	installermdk3wifi()
	installerHashcat()
	installerEttercap()
	installerBettercap()
	installerBully()
	installerReaver()
	installerPixiewps()
	installerAirgeddonTools()
}
maininit()