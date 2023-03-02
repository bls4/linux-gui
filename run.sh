apt update;\
apt install libgbm1 libnspr4 libnss3 libu2f-udev fonts-liberation -y;\
apt-get install -y --no-install-recommends openbox tint2 xdg-utils lxterminal hsetroot tigervnc-standalone-server supervisor sudo dbus-x11 pcmanfm mousepad thonny python3-pip;\
rm -rf /var/lib/apt/lists;\
apt-get update -y;\
apt-get install -y --no-install-recommends openssh-client wget curl rsync ca-certificates apulse libpulse0 tar xzip gzip bzip2 zip unzip;\
rm -rf /var/lib/apt/lists;\
cp menu.xml /etc/xdg/openbox/;\
echo 'hsetroot -solid "#123456" &' >> /etc/xdg/openbox/autostart;\
pip install jupyterlab selenium webdriver_manager undetected_chromedriver==3.4.4 translate;\
pip3 install --upgrade requests;\
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;\
sudo dpkg -i google-chrome-stable_current_amd64.deb;\
rm -rf google-chrome-stable_current_amd64.deb;\
apt --fix-broken install;\
sed -i "s|Exec=/usr/bin/google-chrome-stable %U|Exec=/usr/bin/google-chrome-stable %U --no-sandbox --disable-dev-shm-usage --disable-gpu|g" /usr/share/applications/google-chrome.desktop;\
mkdir /root/.jupyter;\
echo "c.ServerApp.token = ''" > /root/.jupyter/jupyter_notebook_config.py;\
mkdir -p /root/.config/tint2;\
cp tint2rc /root/.config/tint2/;\
cp supervisord.conf /etc/;\
echo '/usr/bin/supervisord' >> /etc/xdg/openbox/autostart
