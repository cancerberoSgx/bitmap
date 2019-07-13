FROM haxe:4.0.0-rc.3-alpine

RUN apk add --no-cache g++ nodejs zip
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h

RUN mkdir ~/haxelib && haxelib setup ~/haxelib
RUN haxelib install utest && haxelib install sure && haxelib install format && haxelib install hxcpp

