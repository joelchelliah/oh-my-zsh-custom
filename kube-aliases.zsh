#############################################################
## Scripts and aliases for Kubernetes stuff.
# Run without args to see usage info.
#############################################################

#############################################################
# DB client
#############################################################

kubedb () {
  [[ "$#" -lt 2 ]] && `_kubedb_usage` && return
  local app=$1
  local env=$2
  local cmd="kubectl exec --namespace $env -it $app-db-$env-mongodb-replicaset-0 -- /bin/sh"

  echo "👾  $cmd" && eval $cmd
}

#############################################################
# Kube pod logs
#############################################################

kubelog () {
  [[ "$#" -lt 2 ]] && `_kubelog_usage` && return
  local app=$1
  local env=$2
  local name=$(if [[ $env == 'production' ]] ;then echo $app; else echo "$app-$env" ;fi)
  local cmd="kubetail --namespace $env -l app=$name"

  echo "👾  $cmd" && eval $cmd
}

#############################################################
# Kube exec shell
#############################################################

kubesh () {
  [[ "$#" -lt 2 ]] && `_kubesh_usage` && return
  local pod=$1
  local cmd="kubectl exec -it $pod -- /bin/sh"

  echo "👾  $cmd" && eval $cmd
}

#############################################################
# Helpers
#############################################################

_kubedb_usage () {
  echo "👾  ---------- Kube DB client --------- 👾" >&2
  echo "Usage:" >&2
  echo "   kubedb <app> <environment>" >&2
  echo "   E.g: kubedb feedback dev" >&2
  echo "        will open a shell client for feedback dev database" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_kubelog_usage () {
  echo "👾  ---------- Kube pod logs ---------- 👾" >&2
  echo "Dependency: Kubetail - https://github.com/johanhaleby/kubetail" >&2
  echo "Usage:" >&2
  echo "   kubelog <app> <environment>" >&2
  echo "   E.g: kubedb feedback dev" >&2
  echo "        will tail all logs from all pods for feedback-dev" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_kubesh_usage () {
  echo "👾  --------- Kube exec shell --------- 👾" >&2
  echo "Usage:" >&2
  echo "   kubesh <pod>" >&2
  echo "   E.g: kubesh feedback-asjkdhf" >&2
  echo "        will open a shell terminal for the pod feedback-asjkdhf" >&2
  echo "👾  ----------------------------------- 👾" >&2
}
