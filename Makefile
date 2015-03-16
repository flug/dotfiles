
install:
	 add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora
	 apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
	 echo deb http://dl.hhvm.com/mint petra main | sudo tee /etc/apt/sources.list.d/hhvm.list
	 apt update && apt upgrade && apt dist-upgrade
	 apt install zsh git npm nginx vim chromium-browser php5-fpm php5-cgi nfs-common vim-gnome
	 apt install php5-cli php5-json gradle most silversearcher-ag exuberant-ctags curl libboost-filesystem1.49.0 libboost-program-options1.49.0 \
	 libboost-regex1.49.0 libboost-thread1.49.0 hhvm
	 wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.deb -O /tmp/elasticsearch-1.4.4.deb
	 dpkg -i /tmp/elasticsearch-1.4.4.deb
	 update-rc.d elasticsearch defaults 95 10

	
clone:
	 git clone https://github.com/greg0ire/git_template ~/.git_template
	 git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	 git clone https://github.com/flug/dotvim ~/.vim
	 cd ~/.vim && git submodule init
	 cd ~
	 git clone https://github.com/flug/dotfiles .dotfiles
	
	 ln -s ~/.dotfiles/.gitignore ~/.gitignore
	 ln -s ~/.dotfiles/gitconfig ~/.gitconfig
	 ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
	 ln -s ~/.dotfiles/jslintrc ~/.jslintrc
	 ln -s ~/.dotfiles/zshrc ~/.zshrc
	 ln -s ~/.dotfiles/composer.json ~/composer.json
	 ln -s ~/.vim/vimrc ~/.vimrc

telegram:
	 wget https://tdesktop.com/linux -O /tmp/telegram.tar.xz
	 tar xvfJ /tmp/telegram.tar.xz 
