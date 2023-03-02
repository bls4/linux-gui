#@markdown <center><h3>VTO - V1</h3></center><br>
import os
import random
import string
import urllib.request
from IPython.display import HTML, clear_output
import time

#####################################
USE_FREE_TOKEN = False # @param {type:"boolean"}
TOKEN = ""  # @param {type:"string"}
REGION = "JP" #@param ["US", "EU", "AP", "AU", "SA", "JP", "IN"]
PORT_FORWARD = "argotunnel" #@param ["ngrok", "localhost", "argotunnel"]

#@markdown <br>

USER = ""  # @param {type:"string"}
PASS = "Anhtai777"  # @param {type:"string"}
DEVICE = "Anhtai777"  # @param {type:"string"}
UTOKEN = "gIg0qlD7clEpvZOu"  # @param {type:"string"}
FILE_RUN = "run1.py" #@param ["run1.py", "run2.py","No Run"]

HOME = os.path.expanduser("~")


os.system(rf'echo -n "{USER}" > mail')
os.system(rf'echo -n "{PASS}" > pass')
os.system(rf'echo -n "{DEVICE}" > device')
os.system(rf'echo -n "{UTOKEN}" > token')

if not os.path.exists(f"{HOME}/.ipython/ocr.py"):
    hCode = "https://raw.githubusercontent.com/biplobsd/" \
                "OneClickRun/master/res/ocr.py"
    urllib.request.urlretrieve(hCode, f"{HOME}/.ipython/ocr.py")

from ocr import (
    runSh,
    loadingAn,
    PortForward_wrapper,
    displayUrl,
    findProcess,
    CWD,
    textAn,
)

# github latest releases tag define
def latestTag(link):
  import re
  from urllib.request import urlopen
  htmlF = urlopen(link+"/releases/latest").read().decode('UTF-8')
  return re.findall(r'.+\/tag\/([.0-9A-Za-z]+)".+/', htmlF)[0]


loadingAn()

os.makedirs("tools/noVnc", exist_ok=True)

# password ganarate
try:
  print(f"Found old password! : {password}")
except:
  password = ''.join(random.choice(string.ascii_letters + string.digits) for i in range(20))


clear_output()
if not findProcess("Xtightvnc", ":1"):
  textAn("Wait for almost 60 seconds. It's doing for VNC ready ...")
  os.makedirs(f'{HOME}/.vnc', exist_ok=True)
  os.system('apt update -y')
  os.system('apt install -y tint2 tightvncserver autocutsel openbox lxterminal pcmanfm')



  os.system(rf'echo "{password}" | vncpasswd -f > ~/.vnc/passwd')
  data = """
#!/bin/bash
xrdb $HOME/.Xresources
xsetroot -solid black -cursor_name left_ptr
autocutsel -fork
openbox-session "$@" &
tint2 "$@" &
"""
  with open(f'{HOME}/.vnc/xstartup', 'w+') as wNow:
    wNow.write(data)
  os.chmod(f'{HOME}/.vnc/xstartup', 0o755)
  os.chmod(f'{HOME}/.vnc/passwd', 0o400)
  
  runSh('sudo vncserver :1 -geometry 1440x870 -economictranslate -dontdisconnect &', 
        shell=True)

  BASE_URL = "https://github.com/geek1011/easy-novnc"
  LATEST_TAG = latestTag(BASE_URL)
  output_file = "tools/noVnc/easy-noVnc_linux-64bit"
  file_name = f"easy-novnc_linux-64bit"
  urlF = f"{BASE_URL}/releases/download/{LATEST_TAG}/{file_name}"
  try:
    urllib.request.urlretrieve(urlF, output_file)
  except OSError:
    pass
  os.chmod(output_file, 0o755)

if not findProcess("easy-noVnc_linux-64bit", '--addr "0.0.0.0:6080"'):
  cmdDo = "./easy-noVnc_linux-64bit --addr 0.0.0.0:6080 --port 5901" \
    " &"
  runSh(cmdDo, 
        cd="tools/noVnc/",
        shell=True)


# START_SERVER
# Ngrok region 'us','eu','ap','au','sa','jp','in'
clear_output()
Server = PortForward_wrapper(PORT_FORWARD, TOKEN, USE_FREE_TOKEN, [['vnc', 6080, 'http']], REGION.lower(), 
               [f"{HOME}/.ngrok2/noVncFast.yml", 4455])

data = Server.start('vnc', displayB=False)
# clear_output()
displayUrl(data, pNamU='noVnc : ',
            EcUrl=f'/vnc.html?autoconnect=true&password={password}&path=vnc&resize=scale&reconnect=true&show_dot=true')
