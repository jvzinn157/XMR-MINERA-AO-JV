#!/data/data/com.termux/files/usr/bin/bash

echo "Atualizando repositórios..."
pkg update -y && pkg upgrade -y

echo "Ativando repositórios extras..."
pkg install -y x11-repo

echo "Atualizando novamente após ativar repo..."
pkg update -y

echo "Instalando dependências..."
pkg install -y git cmake clang make wget

echo "Limpando instalações antigas..."
cd ~
rm -rf xmrig

echo "Clonando xmrig..."
git clone https://github.com/xmrig/xmrig.git

echo "Entrando na pasta..."
cd xmrig || exit

echo "Criando build..."
rm -rf build
mkdir build
cd build || exit

echo "Compilando (sem hwloc para evitar erro)..."
cmake .. -DWITH_HWLOC=OFF

echo "Compilando binário..."
make -j2

echo ""
echo "=============================="
echo "INSTALAÇÃO FINALIZADA"
echo "=============================="
echo ""
echo "Para iniciar:"
echo "cd ~/xmrig/build"
echo "./xmrig"
