# crx container

> An executable container to package Chrome Extensions everwhere!

The container encloses `openssl`, Node 0.10 and [crx](https://npmjs.org/crx).

# Install

```bash
docker pull oncletom/crx
```

# Run

```bash
docker run -t oncletom/crx --help
```

Please read [`crx` CLI API documentation](https://github.com/oncletom/crx/blob/master/README.md#cli-api) for more examples about how to run `crx` from the command line.

```bash
docker run --rm -t -v /path/to/your/extension:/tmp/crx oncletom/crx pack > extension.crx
```

The `-v` flag associates your local filesystem with the container filesystem and returns back the binary data to your local standard output.

## Tips

Alias `crx` command so it will use this Docker image. Add the following to your zshrc/bashrc :

```bash
function crx() {
  local from_dir crx_command
  
  crx_command="$1"
  
  if [ -n "$2" ]; then
    from_dir=$(cd "${2%/*}" && echo "$PWD/${2##*/}")
  fi

  set -- ${@:3:$#}
  
  docker run --rm -t -v $(if [ -n "${from_dir}" ]; then echo "${from_dir}"; else echo $(pwd); fi):/tmp/crx oncletom/crx "${crx_command}" $(if [ -n "${from_dir}" ] ; then echo /tmp/crx; fi) $@
}
```

Then just use the `crx` command as you would if it was installed with NPM.
