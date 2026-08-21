
## ## ## ## Docker aliases ## ## ## ## ##
#
# Make sure to also check out docker-compose.plugin.zsh
# which also has some docker aliases.
#
## ## ## ## ## ## ## ## ## ## ## ## ## ##

# Clears build cache, and shows you the resulting disk usage.
alias docker-reclaim='docker builder prune -af && docker system df'

# If you also want to prune unused volumes (careful — only do this when you're sure no needed data volumes are orphaned):
alias docker-reclaim-all='docker builder prune -af && docker volume prune -f && docker system df'
