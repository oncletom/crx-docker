#!/bin/bash

function crx() {
  local from_dir crx_command

  crx_command="$1"

  if [ -n "$2" ]; then
    from_dir=$(cd "${2%/*}" && echo "$PWD/${2##*/}")
  fi

  set -- ${@:3:$#}

  docker run --rm -t -v $(if [ -n "${from_dir}" ]; then echo "${from_dir}"; else echo $(pwd); fi):/tmp/crx oncletom/crx "${crx_command}" $(if [ -n "${from_dir}" ] ; then echo /tmp/crx; fi) $@
}
