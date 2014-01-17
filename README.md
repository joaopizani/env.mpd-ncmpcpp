env.mpd-ncmpcpp
===============

Nice and self-contained configuration for a local-only and/or networked MPD server, along with NCMPCPP client conf.

Some time ago I became tired of the annoyances caused by usual music players, and decided to give
[MPD (Music Player Daemon)](http://www.musicpd.org/) a go.
I knew, however, that having a **good MPD client** would be a key to make the experience not suck.
So after a lot of research, I decided that [NCMPCPP](http://ncmpcpp.rybczak.net/) was my best bet.

Being who I am, I meticulously fine-tuned the settings of both MPD and NCMPCPP in a way which was very convenient to use.
But also, the settings have a **gradient of customizability**, in which _reasonable defaults are present_,
but settings which are more personal are _easy to customize_.

The more personal the setting, the easier it is to override the defaults I coded in.

Enough with background and motivations, let's take a look at what gives this MPD+NCMPCPP its "taste":

Highlights of the configuration
-------------------------------

### MPD configs

  * There is already an MPD audio output setup for the _PulseAudio_ backend on the local machine.
    So you should be able to listen to music without no extra config. Of course you CAN add other outputs.
  * An _visualization_ output is also already setup in MPD.
    The fifo in `/tmp` is used by NCMPCPP to provide awesome waveform and spectrum visualization.

  * All music-related files is supposed to be in a single directory.
    This setup assumes a link called `${HOME}/Music` pointing to this centralized music directory.
      + Meta information is centralized in `<music-dir>/meta`.
          - Lyrics are all kept in `<music-dir>/meta/lyrics`, with a link at `~/.lyrics`.
          + Playlist are all kept in `<music-dir>/meta/playlists`.

### NCMPCPP configs

  * Columns with song attributes to be displayed in the playlist were selected to be a compromise between
    the most informative and less introsive possible, with a number of columns that should appear OK even in small consoles.

  * Colors are enabled in the interface of NCMPCPP, with an informative but non-intrusive color scheme.

  * Lyrics are downloaded in the background for the current song, stored in `<music-dir>/meta/lyrics` and can be displayed by pressing `l`.
      + Several different repositories are used when searching for the lyrics.

### Choice between _local-only_ or _networked_ MPD

When installing the contents of this repository (more details on installation below),
the user can choose whether to run MPD _exclusively locally_ or _open to the local network_. 
What this means is the following:

  * If run _locally_, then MPD listens only to connections from _localhost_, and **no other machines** will be able to use your music server.
  * If run _open to the LAN_, MPD will listen to connections coming from any host in the local network.
    In this way you can use (for example) an old computer in your house as a "music server" in the living room.
      + The client will be asked for a password upon connection. The default password is "mpd1" but can be changed in `mpd.conf.open`.

**OBS:** You need to change the IP address to which MPD binds if you want to run it open in the LAN.
Search for a line containing `bind_to_address "192.<rest-of-adress>"` in `mpd.conf.open` and insert the desired IP there.

How to install
--------------

The way in which to install this configuration depends on whether you will run MPD in a system with a desktop enviroment
and want MPD to be started at **login time** and be run by a **normal-user, non-privileged account**:

  * If MPD will be run in a system with no desktop environment, the to install, run `./install-basic.sh`.
      + In this case, you will need to arrange yourself for MPD to start at boot.

  * If using a desktop environment, you can use the script `./install-with-extra-steps.sh`.
      + This will make a `mpd.desktop` file at put it in the `autostart` directory of you DE,
        making MPD be run at every log-in, _by the user logging in (not root)_.

