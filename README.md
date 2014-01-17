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

The ideal I strive for is: the more personal the setting, the easier it should be to override the defaults.

Enough with background and motivations, let's take a look at what gives this MPD+NCMPCPP its "taste":


Highlights of the configuration
-------------------------------

### MPD configs

  * There is already an MPD audio output setup for the _PulseAudio_ backend on the local machine.
    So you should be able to listen to music without any extra config. Of course you CAN add other outputs.
  * A _visualization_ output is also already setup for MPD.
    The fifo in `/tmp` is used by NCMPCPP to provide awesome waveform and spectrum visualization.

  * All music-related files are supposed to be in a single directory.
    A link called `${HOME}/Music` is assumed to exist and point to this centralized music directory.
      + Meta information is centralized under `<music-dir>/meta`.
          - Lyrics are all kept in `<music-dir>/meta/lyrics`, with a link at `~/.lyrics`.
          + Playlist are all kept in `<music-dir>/meta/playlists`.

### NCMPCPP configs

  * Columns with song attributes displayed in the playlist were selected to be a compromise between
    the most informative and less intrusive possible, with a number of columns that should fit even in small consoles.

  * Colors are enabled in the interface of NCMPCPP, with an informative but non-intrusive color scheme.

  * Lyrics are downloaded in the background for the current song, stored in `<music-dir>/meta/lyrics` and can be displayed anytime by pressing `l`.
      + Several different repositories are used when searching for lyrics.

### Choice between _local-only_ or _networked_ MPD

When installing the contents of this repository (more details on installation below),
the user can choose whether to run MPD _exclusively locally_ or _open to the local network_. 
What this means is the following:

  * If run _locally_, then MPD listens only to connections from _127.0.0.1_, and **no other machines** will be able to use your music server.
  * If run _open to the LAN_, MPD will listen to connections coming from any host in the local network.
    In this way you can use (for example) an old computer in your house as a "music server" in the living room.
      + The client will be asked for a password upon connection. The default password is "mpd1" but can be changed in `mpd.conf.open`.

**OBS:** You need to change the IP address to which MPD binds if you want to run it open in the LAN.
Search for a line containing `bind_to_address "192.<bla-bla-bla>"` in `mpd.conf.open` and insert the desired IP there.

How to install
--------------

The way in which to install this configuration depends on whether you will run MPD in a system with a desktop enviroment
and want MPD to be started at **login time** and run by a **normal-user, non-privileged account**:

  * If MPD will be run in a system with no desktop environment, then to install run `./install-basic.sh`.
      + In this case, you will need to arrange yourself for MPD to start at boot.

  * If using a desktop environment, then to install you can run `./install-with-extra-steps.sh`.
      + This will put a `mpd.desktop` file in the `autostart` directory of you desktop environment,
        effectively causing MPD to be run at every log-in, _by the user logging in (not root)_.

