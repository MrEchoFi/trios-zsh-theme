# ================================================================
#  trios.zsh-theme
#  Faithful recreation of the "trios" terminal design by MrEchoFi
#
#  Design spec (from screenshot):
#    ⬡ username  ⬡ ~/path  >>_ cmd
#    [output in cyan  — success]
#    [output in red   — error / non-zero exit]
#
#  Segments:
#    PROMPT  : ⬡ user  ⬡ path  >>_
#    RPROMPT : (empty — clean look)
#
#  Colours match screenshot exactly:
#    Prompt hexagon + path : cyan   (#00bcd4 → term colour 6/cyan)
#    Username              : white  (bold)
#    >>_  arrow            : white
#    Typed command         : white  (terminal default)
#
#  The "echo of command in colour" effect is achieved via
#  preexec / precmd hooks:
#    • preexec  : prints the command in cyan before it runs
#    • precmd   : captures exit code; colours next echo accordingly
#
#  Author  : MrEchoFi_Md. Abu Naser Nayeem (https://github.com/MrEchoFi)
#  Theme   : trios
#  License : MIT
# ================================================================

# ── Colour tokens ────────────────────────────────────────────
# Override in ~/.zshrc BEFORE sourcing oh-my-zsh.sh
TRIOS_COLOR_HEX="${TRIOS_COLOR_HEX:-cyan}"        # ⬡ bullets & path
TRIOS_COLOR_USER="${TRIOS_COLOR_USER:-white}"      # username text
TRIOS_COLOR_ARROW="${TRIOS_COLOR_ARROW:-white}"    # >>_ arrow
TRIOS_COLOR_CMD_OK="${TRIOS_COLOR_CMD_OK:-cyan}"   # echoed cmd — success
TRIOS_COLOR_CMD_FAIL="${TRIOS_COLOR_CMD_FAIL:-red}" # echoed cmd — error
TRIOS_COLOR_PATH="${TRIOS_COLOR_PATH:-cyan}"       # path segment

# ── Symbol — U+2B21 WHITE HEXAGON (outline) ──
# Override: TRIOS_HEX="⬢"  for filled, or TRIOS_HEX="*" for ASCII
TRIOS_HEX="${TRIOS_HEX:-⬡}"

# ── Internal state ───────────────────────────────────────────
_trios_last_exit=0
_trios_cmd_text=""

# ── preexec: fires just before each command executes ─────────
# Echoes the command in cyan (ok) or red (previous cmd failed).
# This is the coloured command repeat visible in the screenshot.
_trios_preexec() {
  _trios_cmd_text="$1"
  if [[ $_trios_last_exit -eq 0 ]]; then
    print -Prn -- "%F{${TRIOS_COLOR_CMD_OK}}${_trios_cmd_text}%f"$'\n'
  else
    print -Prn -- "%F{${TRIOS_COLOR_CMD_FAIL}}${_trios_cmd_text}%f"$'\n'
  fi
}

# ── precmd: fires just before each prompt is drawn ───────────
_trios_precmd() {
  _trios_last_exit=$?
}

# Register hooks (safe — won't duplicate if already added)
autoload -Uz add-zsh-hook
add-zsh-hook preexec _trios_preexec
add-zsh-hook precmd  _trios_precmd

# ── Prompt ───────────────────────────────────────────────────
#
#  Visual:   ⬡ tanjib  ⬡  ~/Documents/trios_rust  >>_ _
#
#  Breakdown:
#    %F{cyan}⬡%f            — cyan hexagon
#    %F{white}%B tanjib %b  — bold white username
#    %F{cyan}⬡%f            — cyan hexagon
#    %F{cyan} %~%f          — cyan path (abbreviated ~)
#    %F{white} >>_%f        — white arrow prompt
#    <space>                — cursor breathing room
#
PROMPT='%F{${TRIOS_COLOR_HEX}}${TRIOS_HEX}%f %F{${TRIOS_COLOR_USER}}%B%n%b%f  %F{${TRIOS_COLOR_HEX}}${TRIOS_HEX}%f %F{${TRIOS_COLOR_PATH}} %~%f %F{${TRIOS_COLOR_ARROW}}>>_%f '

# Right prompt intentionally empty — matches screenshot
RPROMPT=''
