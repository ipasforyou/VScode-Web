USERNAME=$REPL_SLUG

VERSION=3.10.2 #Configura a versão desejada, veja em https://github.com/cdr/code-server/releases/

URL=https://github.com/cdr/code-server/releases/download/v$VERSION/code-server-$VERSION-linux-amd64.tar.gz

FILE=/home/runner/$USERNAME/code-server-$VERSION-linux-amd64
USER_DATA=/home/runner/$USERNAME/user-data/

PASSWORD=thundr

export PASSWORD=$PASSWORD
mkdir $USER_DATA

if [ ! -d "$FILE/" ]
then
    wget $URL
    tar -vzxf $FILE.tar.gz
    echo "  Nome da repl: $USERNAME 😎  
    Versão desejada: $VERSION 🥵  
    Senha: $PASSWORD 🕵️‍♂️"
    $FILE/bin/code-server --user-data-dir $USER_DATA --bind-addr 0.0.0.0:80

else
    echo "  Nome da repl: $USERNAME 😎  
    Versão desejada: $VERSION 🥵  
    Senha: $PASSWORD 🕵️‍♂️"
    $FILE/bin/code-server --user-data-dir $USER_DATA --bind-addr 0.0.0.0:80
fi
