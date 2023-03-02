mkdir ~/.vnc;\
apt update -y;\
apt install -y tint2 tightvncserver autocutsel openbox lxterminal pcmanfm sudo;\
echo "pw1971" | vncpasswd -f > ~/.vnc/passwd;\
echo "#!/bin/bash" >> ~/.vnc/xstartup;\
echo "xrdb $HOME/.Xresources" >> ~/.vnc/xstartup;\
echo "xsetroot -solid black -cursor_name left_ptr" >> ~/.vnc/xstartup;\
echo "autocutsel -fork" >> ~/.vnc/xstartup;\
echo "openbox-session "$@" &" >> ~/.vnc/xstartup;\
echo "tint2 "$@" &" >> ~/.vnc/xstartup;\
chmod +x ~/.vnc/passwd;\
chmod +x ~/.vnc/xstartup;\
sudo vncserver :0 -geometry 1600x900 -economictranslate -dontdisconnect "$@" & ;\
wget https://github.com/pgaskin/easy-novnc/releases/download/v1.1.0/easy-novnc_linux-64bit ;\
chmod +x ./easy-noVnc_linux-64bit ;\
./easy-noVnc_linux-64bit --addr 0.0.0.0:6080 --port 5901
