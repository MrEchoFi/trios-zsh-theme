# trios — ZSH Theme

<p align="center">
  <img src="preview.png" alt="trios theme preview" width="700"/>
</p>

<p align="center">
  <a href="https://github.com/ohmyzsh/ohmyzsh"><img src="https://img.shields.io/badge/Oh%20My%20Zsh-compatible-brightgreen"/></a>
  <img src="https://img.shields.io/badge/shell-zsh-informational"/>
  <img src="https://img.shields.io/badge/style-cyberpunk%20minimal-blueviolet"/>
</p>

A minimal cyberpunk shell prompt. Clean two-segment layout — username and path separated by hexagon bullets — with a colour-coded command echo on every keystroke: **cyan** for success, **red** for error.

---

## Design

```
⬡ tanjib  ⬡  ~/Documents/trios_rust/trios_terminal_rust >>_ cd ..
cd ..
⬡ tanjib  ⬡  ~/Documents/trios_rust >>_ cd ..
cd ..
⬡ tanjib  ⬡  ~/Documents >>_ cd..
cd..
/bin/bash: line 1: cd..: command not found
⬡ tanjib  ⬡  ~/Documents >>_ cd ..
cd ..
⬡ tanjib  ⬡  ~ >>_ ls
ls
10.48.141.132.gnmap
10.48.141.132.nmap
10.48.141.132.xml
AllForOne
```

| Element | Colour | Notes |
|---------|--------|-------|
| `⬡` hexagon bullets | Cyan | Separates prompt segments |
| Username | White bold | `%n` |
| Path | Cyan | Abbreviated `%~` |
| `>>_` arrow | White | Input cursor marker |
| Command echo (success) | **Cyan** | Printed via `preexec` hook |
| Command echo (error) | **Red** | When previous exit code ≠ 0 |

---

## Requirements

- **Zsh** ≥ 5.0
- **[Oh My Zsh](https://ohmyz.sh/)**
- Any monospace terminal font (no Nerd Font needed — uses `⬡` Unicode)

---

## Installation

### One-liner

```zsh
git clone https://github.com/MrEchoFi/trios-zsh-theme \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/trios && \
  sed -i 's/^ZSH_THEME=.*/ZSH_THEME="trios"/' ~/.zshrc && \
  source ~/.zshrc
```

### Manual

```zsh
# 1. Clone
git clone https://github.com/tanjib/trios-zsh-theme \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/trios

# 2. Edit ~/.zshrc
ZSH_THEME="trios"

# 3. Reload
source ~/.zshrc
```

---

## Customisation

Add any of these to `~/.zshrc` **before** `source $ZSH/oh-my-zsh.sh`:

```zsh
# Change the hexagon symbol (e.g. plain ASCII)
TRIOS_HEX="*"

# Change colours (any zsh colour name or 256-code)
TRIOS_COLOR_HEX="cyan"       # ⬡ bullets and path
TRIOS_COLOR_USER="white"         # username
TRIOS_COLOR_ARROW="white"        # >>_ arrow
TRIOS_COLOR_CMD_OK="cyan"        # command echo on success
TRIOS_COLOR_CMD_FAIL="red"       # command echo on error
```

### 256-colour example (electric blue prompt)

```zsh
TRIOS_COLOR_HEX="39"
TRIOS_COLOR_PATH="39"
TRIOS_COLOR_CMD_OK="39"
```

---

## Terminal background

The screenshot uses a dark background with a cyberpunk armour wallpaper.
Recommended terminal settings:

- Background: `#0a0c0f` (near-black)
- Opacity: ~85% (lets wallpaper show through)
- Font: `JetBrains Mono`, `Hack`, or `Fira Code` at 13–14pt

---

## License

[MIT](LICENSE) © MrEchoFi
