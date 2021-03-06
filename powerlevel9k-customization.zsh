POWERLEVEL9K_MODE='awesome-patched'

# Prompt Line
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""

# Context Segment
DEFAULT_USER="$USER"

# Directory Segment
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

# Version Control Segment
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

# Status Segment
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

# Time Segment
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

# Prompt Segments View
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status background_jobs root_indicator context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(load ram time)


## Entur project icons in current path
# USAGE:
#   Inside the `prompt_dir() {` function, under the relevant STRATEGY, add this after calculating current_path:
#
#     current_path=$(powerLevelIconifyEntur $current_path)
#
function powerLevelIconifyEntur () {
  echo $((echo $1) \
  | sed -e "s,packages, 📦 ," \
  | sed -e "s,client-native, 📱 ," \
  | sed -e "s,client-web, 🖥'	," \
  | sed -e "s,client-widget, 🕹' ," \
  | sed -e "s,i18n, 📚 ," \
  )
}
