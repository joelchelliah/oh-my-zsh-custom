#############################################################
## Scripts for Helm install, update and delete of Entur apps.
# Run without args to see usage info.
#############################################################

readonly SUPPORTED_APPS=" offers feedback "
readonly SUPPORTED_ENVS=" dev staging production "

#############################################################
# Helm Install
#############################################################

hins () {
  [[ "$#" -lt 3 ]] && `_hins_usage` && return
  local app=$1
  local env=$2
  local tag=$3
  local dry=$(if [[ $4 == 'dry' ]] ;then echo "--dry-run --debug"; else echo "" ;fi)
  local name=$(if [[ $env == 'production' ]] ;then echo $app; else echo "$app-$env" ;fi)
  local domain=$(if [[ $env == 'production' ]] ;then echo "entur.org"; else echo "entur.io" ;fi)
  local cmd="helm install --name $name --namespace $env --set environment=$env --set imageTag=$tag --set domain=$domain $dry entur/offers"

  [ $(_is_app_valid $app) -eq 1 ] && [ $(_is_env_valid $env) -eq 1 ] && `_helm_command_confirm_and_run "$cmd"`
}

#############################################################
# Helm Update
#############################################################

hupd () {
  [[ "$#" -lt 3 ]] && `_hupd_usage` && return
  local app=$1
  local env=$2
  local tag=$3
  local dry=$(if [[ $4 == 'dry' ]] ;then echo "--dry-run --debug"; else echo "" ;fi)
  local name=$(if [[ $env == 'production' ]] ;then echo $app; else echo "$app-$env" ;fi)
  local domain=$(if [[ $env == 'production' ]] ;then echo "entur.org"; else echo "entur.io" ;fi)
  local cmd="helm upgrade $name --set environment=$env --set imageTag=$tag --set domain=$domain $dry entur/offers"

  [ $(_is_app_valid $app) -eq 1 ] && [ $(_is_env_valid $env) -eq 1 ] && `_helm_command_confirm_and_run "$cmd"`
}

#############################################################
# Helm Delete
#############################################################

hdel () {
  [[ "$#" -lt 1 ]] && `_hdel_usage` && return
  local name=$1
  local dry=$(if [[ $2 == 'dry' ]] ;then echo "--dry-run --debug"; else echo "" ;fi)
  local cmd="helm del --purge $dry $name"

  `_helm_command_confirm_and_run "$cmd"`
}

#############################################################
# Helpers
#############################################################

_hins_usage () {
  echo "👾  ---------- Helm  install ---------- 👾" >&2
  echo "Usage:" >&2
  echo "   hins <app> <environment> <tag> [dry]" >&2
  echo "   E.g: hins feedback dev master-v1" >&2
  echo "        will install 'feedback-dev', under namespace: 'dev', with environment 'dev' and imageTag 'master-v1'" >&2
  echo "        (optional [dry] arg will add \"--dry-run --debug\" to helm cmd)" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_hupd_usage () {
  echo "👾  ---------- Helm  upgrade ---------- 👾" >&2
  echo "Usage:" >&2
  echo "   hupd <app> <environment> <tag> [dry]" >&2
  echo "   E.g: hupd feedback dev master-v1" >&2
  echo "        will upgrade 'feedback-dev', under namespace: 'dev', with environment 'dev' and imageTag 'master-v1'" >&2
  echo "        (optional [dry] arg will add \"--dry-run --debug\" to helm cmd)" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_hdel_usage () {
  echo "👾  ------- Helm delete & purge ------- 👾" >&2
  echo "Usage:" >&2
  echo "   hdel <name> [dry]" >&2
  echo "   E.g: hdel feedback-dev" >&2
  echo "        will delete and purge 'feedback-dev'" >&2
  echo "        (optional [dry] arg will add \"--dry-run --debug\" to helm cmd)" >&2
  echo "👾  ----------------------------------- 👾" >&2
}

_is_app_valid () {
  if [[ $SUPPORTED_APPS =~ " $1 " ]];
  then
    echo 1
  else
    echo "👾  Invalid app: $1" >&2
    echo "   Only the following apps are accepted: [$SUPPORTED_APPS]" >&2
    echo 0
  fi
}

_is_env_valid () {
  if [[ $SUPPORTED_ENVS =~ " $1 " ]];
  then
    echo 1
  else
    echo "👾  Invalid env: $1" >&2
    echo "   Only the following envs are accepted: [$SUPPORTED_ENVS]" >&2
    echo 0
  fi
}

_helm_command_confirm_and_run () {
  local cmd="$1"
  echo "👾  ----------------------------------- 👾" >&2
  echo "Run the following command? (yes/no)" >&2
  echo "$cmd" >&2
  echo "👾  ----------------------------------- 👾" >&2
  read answer
  if echo "$answer" | grep -iq "^yes" ;then echo "$cmd" ;else echo "ok :(" >&2 ;fi
}
