# How to use these include files

These files are designed to be included into a shell script directly from github.

This method works in zsh (and possibly non-macos bash) via piping source <- curl:

```bash
    source <(curl -sSL https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
```

An alternative using wget via piping source <- wget:

```bash
source <(wget -qO- https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
```

An alternative to the above method that pipes curl -> source in the other direction and also *works in zsh*:

``` bash
    curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh | source /dev/stdin
```

This method is a little hard to read but seems to work on *both bash and zsh on macos* via source <- curl using /dev/stdin:

```bash
    source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)"
```

