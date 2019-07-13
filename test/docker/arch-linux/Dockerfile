FROM archlinux/base

RUN pacman --noconfirm -Syyuu
RUN pacman -S --noconfirm gcc haxe nodejs npm 
RUN mkdir ~/haxelib && haxelib setup ~/haxelib
RUN haxelib install utest && haxelib install sure && haxelib install format&& haxelib install hxcpp
RUN pacman --noconfirm -Scc