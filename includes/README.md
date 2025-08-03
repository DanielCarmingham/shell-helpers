# How to use these include files

These files are designed to be included into a shell script.

|script|description|
|-|-|
|`colors.sh`|Variables for using colors in shell scripts i.e., $RED, $LIGHTRED, $NOCOLOR

## Importing from a local file (recommended)

Download the file via curl:

```bash
    curl -sO https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh
```

...or, download via wget:

```bash
    wget -q https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh
```

Then import the file:

```bash
    source colors.sh
```

## Importing directly from github

Importing directly means the script will be dependent on an internet connection, and cause a lag when loading, but will always get the latest version of the script.

There are several ways to do this:

1. This method works in zsh (and possibly non-macos bash) via piping source <- curl:

```bash
    source <(curl -sSL https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
```

2. An alternative using wget via piping source <- wget:

```bash
source <(wget -qO- https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)
```

3. An alternative to the above method that pipes curl -> source in the other direction and also *works in zsh*:

``` bash
    curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh | source /dev/stdin
```

4. This method is a little hard to read but seems to work on *both bash and zsh on macos* via source <- curl using /dev/stdin:

```bash
    source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/DanielCarmingham/shell-helpers/main/includes/colors.sh)"
```

