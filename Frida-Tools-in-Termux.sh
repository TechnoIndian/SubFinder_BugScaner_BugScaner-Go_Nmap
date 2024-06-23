clear                     
termux-setup-storage
apt update -y && apt upgrade --assume-yes -o Dpkg::Options::="--force-confold"
apt install -y build-essential python python-pip git wget binutils openssl
cd $PREFIX/lib/python3.11/__pycache__ && _file=$(find $PREFIX/lib/python3.11/_sysconfigdata*.py) && rm -rf $PREFIX/lib/python3.11/__pycache__ && sed -i 's|-fno-openmp-implicit-rpath||g' "$_file"
cd $TMPDIR
pip install -U setuptools wheel
pip cache purge
pip download frida==16.2.1
gzip -d *.gz && tar -xvf *.tar && rm *.tar && cd frida-16*
latest_version=$(curl -s https://api.github.com/repos/frida/frida/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && curl -L -o frida-core-devkit-${latest_version}-android-arm64.tar.xz https://github.com/frida/frida/releases/download/${latest_version}/frida-core-devkit-${latest_version}-android-arm64.tar.xz
unxz *.xz && tar -xvf *.tar && export FRIDA_CORE_DEVKIT=$PWD
pip wheel .
pip install *.whl frida-tools
pip cache purge
cd ..
rm -rf frida-16*
cd && rm Frida-Tools-in-Termux.sh && clear
termux-open-url https://t.me/rktechnoindians

RED="\e[31m"
PINK="\e[95m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

echo -e "${RED} ⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣶⣦⣄⡀
⠀⠀⠀⠀⠀⣠⣾⣿⣿⠿⠛⢉⣠⠤⣤⣤⣤⣌⣉⠛⢦⡀
⠀⠀⠀⢀⣾⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣿⣦⡙⢢⡀
⠀⠀⢠⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣦⡑⡀⠀⠀⠀⢀⠀⡀⠀⠀⠀⠀⣀⠀⡀
⠀⢠⣿⣿⡿⠁⢀⣤⣤⣤⣤⣤⣀⣀⣀⣀⠀⢀⣀⣀⠀⠹⣿⣷⡀⠀⠀⠀⢨⢿⡅⠀⠀⠀⠀⣸⢿⡁
⠀⣾⣿⣿⠁⠀⠸⠿⠿⠿⣿⣿⡿⠿⠿⠿⠀⣸⣿⡏⠀⠀⠹⣿⣷⠀⠀⠀⠈⠀⠁⠀⠀⠀⠀⠉⠀⠁
⢰⣿⣿⡟⠀⠀⠀⠀⠀⢀⣿⣿⠁⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⣿⣿⡆⠀⣴⠞⠛⠛⣿⠀⠀⣿⠀⠀⣠⡾⠃
⢸⣿⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⣿⣿⠁⠀⠀⠀⢸⣿⡇⠀⣏⠀⠀⠀⣿⠀⠀⣿⠀⣰⠟
⢸⣿⣿⡇⠀⠀⠀⠀⠀⣼⣿⡿⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⢸⣿⡇⠀⠻⣦⣤⣤⣿⠀⠀⣿⡾⣷⡀
⠸⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⢸⣿⡟⠀⠀⠀⠀⣿⣿⡇⠀⢠⡟⠀⠀⣿⠀⠀⣿⠁⠈⢿⡄
⠀⣿⣿⣿⡀⠀⠀⠀⢠⣿⣿⠇⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⢰⣿⡿⠀⢠⡿⠀⠀⠀⣿⠀⠀⣿⠀⠀⠈⢻⣆
⠀⠸⣿⣿⣧⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⢀⣿⣿⠇⠀⠀⢠⣿⣿⠃⠀⠀⠀⠀⢦⣴⠂⠀⠀⠀⠘⣷⡃
⠀⠀⠹⣿⣿⣧⡀⠀⠘⠛⠛⠀⠀⠀⠀⠘⠛⠛⠀⢀⣴⣿⡿⢡⠂⠀⠀⠀⠀⠞⠻⠆⠀⠀⠀⠈⠁⠉
⠀⠀⠀⠘⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣿⠿⢋⡴⠁
⠀⠀⠀⠀⠀⠙⢿⣿⣿⣦⣄⡀⠒⠒⠶⠾⠟⠛⢋⣡⡴⠋
⠀⠀⠀⠀⠀⠀⠀⠉⠻⠿⣿⣿⣿⣶⣶⣶⡾⠿⠛⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉ ${ENDCOLOR}   " 
                                          
echo -e "${GREEN}🇮🇳 ࿗ T̴͢͢e̴͢͢c̴͢͢h̴͢͢n̴͢͢o̴͢͢ ☣ I̴͢͢n̴͢͢d̴͢͢i̴͢͢a̴͢͢ ࿗ 🇮🇳${ENDCOLOR}"
echo -e "${GREEN}︻デ═一 @rktechnoindians${ENDCOLOR}"
echo -e "${GREEN}︻デ═一 @RK_TECHNO_INDIA${ENDCOLOR}"
echo -e "${RED}🚩 ࿗ Jai Shree Ram ࿗ 🚩
     🛕🛕🙏🙏🙏🛕🛕${ENDCOLOR}"
     
     
echo -e "\e[32m===========================================\e[0m" && echo -e "\e[1;34m[*] \e[32mGreat ! \e[1;31mFЯIDA \e[32mInstalled Successfully..\e[0m" && echo -e "\e[32m===========================================\e[0m"
