#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2021-12-03 23:35:43
 # @LastEditTime: 2022-07-10 10:42:39
 # @LastEditors: Cloudflying
 # @Description: 
 # @FilePath: /.boxs/scripts/macos-build-env-conf.sh
### 

if [[ -d '/usr/local/opt/mariadb@10.2' ]]; then
  export PATH="/usr/local/opt/mariadb@10.2/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/mariadb@10.2/lib"
  export CPPFLAGS="-I/usr/local/opt/mariadb@10.2/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mariadb@10.2/share/pkgconfig"
fi

if [[ -d '/usr/local/opt/mysql@5.7' ]]; then
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/mysql@5.7/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/mysql@5.7/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
fi

# Node Env
if [[ -d '/usr/local/opt/node@12' ]]; then
  export PATH="/usr/local/opt/node@12/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@12/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@12/include"
fi

if [[ -d '/usr/local/opt/node@14' ]]; then
  export PATH="/usr/local/opt/node@14/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@14/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@14/include"
fi

if [[ -d '/usr/local/opt/node@16' ]]; then
  export PATH="/usr/local/opt/node@16/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@16/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@16/include"
fi

if [[ -d '/usr/local/opt/libiconv' ]]; then
    export PATH="/usr/local/opt/libiconv/bin:$PATH"
    export LDFLAGS="$LDFLAGS  -L/usr/local/opt/libiconv/lib"
    export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/libiconv/include"
fi

if [[ -d '/usr/local/opt/krb5' ]]; then
  export PATH="/usr/local/opt/krb5/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/krb5/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/krb5/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/krb5/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/icu4c' ]]; then
  export PATH="/usr/local/opt/icu4c/bin:$PATH"
  export ICU_CFLAGS="$-L/usr/local/opt/icu4c/lib"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/icu4c/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/icu4c/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/enchant' ]]; then
  export PATH="/usr/local/opt/enchant/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/enchant/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/enchant/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/enchant/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/libiconv/lib' ]]; then
  export PATH="/usr/local/opt/libiconv/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/libiconv/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/libiconv/include"
fi

if [[ -d '/usr/local/opt/bzip2/lib' ]]; then
  export PATH="/usr/local/opt/bzip2/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/bzip2/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/bzip2/include"
fi

if [[ -d '/usr/local/opt/openssl@1.1/' ]]; then
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig"
fi