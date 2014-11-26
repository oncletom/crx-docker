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
docker run -t -v /path/to/your/extension:/tmp/crx oncletom/crx pack /tmp/crx > extension.crx
```

The `-v` flag associates your local filesystem with the container filesystem and returns back the binary data to your local standard output.