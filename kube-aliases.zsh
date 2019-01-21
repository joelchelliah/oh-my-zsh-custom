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
  local mongo=$(if [[ $app == 'offers' ]] ;then echo "$app-$env-mongodb-replicaset-0"; else echo "$app-db-$env-mongodb-replicaset-0" ;fi)
  local name=$(if [[ $3 == 'redis' ]] ;then echo $(kubectl get pods --namespace $2 | grep "redis" | awk '{print $1;}'); else echo $mongo ;fi)
  local cmd="kubectl exec --namespace $env -it $name -- /bin/sh"

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
  local pod=$(if [[ $app == 'offers' ]] ;then echo $name-$app; else echo "$name" ;fi)
  local cmd="kubetail --namespace $env -l app=$pod"

  echo "👾  $cmd" && eval $cmd
}

#############################################################
# Kube exec shell
#############################################################

kubesh () {
  [[ "$#" -lt 2 ]] && `_kubesh_usage` && return
  local pod=$1
  local env=$2
  local cmd="kubectl exec --namespace $env -it $pod -- /bin/sh"

  echo "👾  $cmd" && eval $cmd
}

kubepf () {
  [[ "$#" -lt 2 ]] && `_kubepf_usage` && return
  local env=$1
  local pod=$2
  local cmd="kubectl port-forward --namespace $env $pod 9010:9010"

  echo "👾  $cmd" && eval $cmd
}

#############################################################
# Helpers
#############################################################

_kubedb_usage () {
  echo "👾  ---------- Kube DB client --------- 👾" >&2
  echo "Usage:" >&2
  echo "   kubedb <app> <environment> [db]" >&2
  echo "   E.g: kubedb offers dev redis" >&2
  echo "        will open a shell client for offers dev redis DB" >&2
  echo "   If [db] is not specified it will default to mongo DB" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_kubelog_usage () {
  echo "👾  ---------- Kube pod logs ---------- 👾" >&2
  echo "Dependency: Kubetail - https://github.com/johanhaleby/kubetail" >&2
  echo "Usage:" >&2
  echo "   kubelog <app> <environment>" >&2
  echo "   E.g: kubelog feedback dev" >&2
  echo "        will tail all logs from all pods for feedback-dev" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_kubesh_usage () {
  echo "👾  --------- Kube exec shell --------- 👾" >&2
  echo "Usage:" >&2
  echo "   kubesh <pod> <env>" >&2
  echo "   E.g: kubesh asjkdhf dev" >&2
  echo "        will open a shell terminal for the pod asjkdhf in dev" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_kubepf_usage () {
  echo "👾  ------- Kube port forwarding ------ 👾" >&2
  echo "Usage:" >&2
  echo "   kubepf <env> <pod>" >&2
  echo "   E.g: kubepf dev offers-dev-offers-7958fb6b9c-bxphc" >&2
  echo "        will forward the pod through port 9010:9010" >&2
  echo "👾  ----------------------------------- 👾" >&2
}
