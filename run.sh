apt update -y ;\
apt install -y openbox tigervnc-standalone-server supervisor;\
apt install -y hsetroot lxterminal nano wget xdg-utils wget tint2;\
echo 'hsetroot -solid "#123456" &' >> /etc/xdg/openbox/autostart ;\
cp ./easy-novnc /usr/local/bin/ ;\
chmod +x /usr/local/bin/easy-novnc ;\
cp menu.xml /etc/xdg/openbox/ ;\
mkdir -p /root/.config/tint2 ;\
cp tint2rc /root/.config/tint2/ ;\
mkdir "/root/.vnc" ;\
chown -R "root:root" "/root/.vnc" ;\
echo "p123123w" > /root/.vnc/passwd  ;\
chown -R "root:root" "/root/.vnc/passwd" ;\
chmod 400 "/root/.vnc/passwd" ;\
apt update ;\
apt install python3-pip -y ;\
pip install nbconvert ;\
pip install qtconsole ;\
pip install ipywidgets ;\
pip install jupyterlab ;\
pip install selenium ;\
pip install webdriver_manager ;\
pip install undetected_chromedriver==3.4.4 ;\
pip install translate ;\
pip3 install --upgrade requests ;\
apt install libgbm1 libnspr4 libnss3 libu2f-udev fonts-liberation -y ;\
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb ;\
sudo dpkg -i google-chrome-stable_current_amd64.deb ;\
rm -rf google-chrome-stable_current_amd64.deb ;\
apt --fix-broken install ;\
apt update ;\
apt install dbus-x11 pcmanfm mousepad -y ;\
sed -i "s|Exec=/usr/bin/google-chrome-stable %U|Exec=/usr/bin/google-chrome-stable %U --no-sandbox --disable-dev-shm-usage --disable-gpu|g" /usr/share/applications/google-chrome.desktop ;\
mkdir /root/.jupyter ;\
echo "c.ServerApp.token = ''" > /root/.jupyter/jupyter_notebook_config.py ;\
sudo cp ./supervisord.conf /etc/supervisor/conf.d/ ;\
sudo service supervisor start "$@" & \
sudo ufw allow 8888


