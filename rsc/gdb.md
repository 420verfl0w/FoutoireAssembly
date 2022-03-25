## install gdb

```bash
# Ubuntu
sudo apt install gdb

# Arch
sudo pacman -S gdb
```

## Plugins

### [Peda](https://github.com/longld/peda)
> installation
```bash
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"
```

### [Gef](https://gef.readthedocs.io/en/master/)
> quick install
```bash
bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
```

### [pwngdb](https://github.com/scwuaptx/Pwngdb)

```bash
cd ~/
git clone https://github.com/scwuaptx/Pwngdb.git
cp ~/Pwngdb/.gdbinit ~/
```
