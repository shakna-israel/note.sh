# note.sh

A simple note taking application.

---

```note.sh``` is designed to scratch my own itch - it fulfills my needs as a note-taking application, it might not fulfill yours.

But that's okay! It's [effectively as close to Public Domain as I can get](LICENSE).

---

## Platform

* Linux. It's what I'm using.
* macOS. Some prerequisites, but should work.

As for Windows, or anything else, you may be able to get it to work, but it's probably more effort than it's worth.

---

## Install

Requires:

* make
* sh
* basename
* sed
* echo
* find
* test
* vi or another text editor set with $EDITOR

You may have to install ```make```, the others are likely on your system.

However, macOS users will probably have to install basename as well, as it isn't available by default.

When ready to install, run:

```
make install
```

(This may require root permissions. So, maybe add sudo in front.)

If you don't want to install to the default location, there are some settings you can tweak.

```PREFIX``` can change the overall location. By default, this is ```/usr/local```.

```FOLDER``` can change the application folder. By default, this is ```note.sh```.

```BIN``` can change the binary name. By default, this is ```note```.

---

## Uninstall

Change directory to where you installed the program, and then run:

```
make uninstall
```

(This may require root permissions. So, maybe add sudo in front.)

If you changed any variables when you installed it, you will need to resupply those changes to the ```make``` command.

---

## License

Creative Commons 0.

Effectively Public Domain, but see the [LICENSE](LICENSE) for the legal code.
