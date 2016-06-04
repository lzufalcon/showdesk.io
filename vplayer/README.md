
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

Download the version with novnc support:

    $ git clone https://github.com/tinyclub/pyvnc2swf.git
    $ cd pyvnc2swf/pyvnc2swf/

Start x11vnc server on localhost and record it immediately, the session is saved in `tests/` by default:

    $ ./tests/novnc-record.sh

Use the GUI and allow to configure vnc server, port and password:

    $ ./vnc2swf         # Choose outtype: novnc
