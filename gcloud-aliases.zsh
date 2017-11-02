#############################################################
## Scripts and aliases for Gcloud stuff.
# Run without args to see usage info.
#############################################################

#############################################################
# Switch cluster
#############################################################

gcred () {
  [[ "$#" -lt 1 ]] && `_gcred_usage` && return
  local cmd="gcloud container clusters get-credentials $1 --zone=europe-west1-d"

  echo "👾  $cmd" && eval $cmd && echo "" && eval "kubectl config current-context"
}


#############################################################
# Helpers
#############################################################

_gcred_usage () {
  echo "👾  ------- Switch gcloud cluster ----- 👾" >&2
  echo "Usage:" >&2
  echo "   gcred <name>" >&2
  echo "   E.g: gcred entur" >&2
  echo "        will switch to the entur cluster" >&2
  echo "👾  ----------------------------------- 👾" >&2
}
