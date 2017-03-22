
# Tiny noVNC player (vplayer)

This vplayer can replay the noVNC sessions recorded by noVNC or pyvnc2swf.

## noVNC

Download novnc:

    $ git clone https://github.com/novnc/noVNC.git
    $ cd noVNC/

Start novnc server with:

    $ utils/launch.sh --record ./recordings/vnc.record.data

Open novnc client in web browser:

    $ chromium-browser http://localhost:6081/vnc.html

Input the vnc server, port and password, after disconnect, the sessions will be saved in `recordings/`.

## pyvnc2swf

Start x11vnc server on localhost, press 'Start' to record local window: 

    $ ./tools/novnc-record.sh

'Stop' and close the window, then, replay it with VPlayer:

    $ ./tools/novnc-play.sh
