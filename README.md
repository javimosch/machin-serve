# machin-serve 🌐

A static file **HTTP server** written in [machin (MFL)](https://github.com/javimosch/machin). Single native binary, no dependencies — 26 KB.

```
$ serve
machin-serve — http://0.0.0.0:8080/
  serving: .
  auth: disabled
```

## Usage

```bash
serve                          # port 8080, current directory
serve -p 9090                  # custom port
serve -d /var/www              # custom directory
serve -u admin:secret          # with basic auth
serve -p 9090 -d /www -u a:s   # all options
serve -h                       # show help
```

### Options

| Flag | Description |
|------|-------------|
| `-p`, `--port` | Port to listen on (default 8080, binds to `0.0.0.0`) |
| `-d`, `--dir` | Directory to serve (default `.`) |
| `-u`, `--user` | Basic auth credentials in `user:pass` format |
| `-h`, `--help` | Show help and exit |

### Features

- **Serves static files** — HTML, CSS, JS, images, JSON, and more with correct MIME types
- **Directory index** — serves `index.html` for directory paths (with or without trailing `/`)
- **Concurrent** — each request runs in its own goroutine
- **Basic auth** — opt-in HTTP Basic authentication
- **Path traversal protection** — blocks `..` in request paths
- **Binds to `0.0.0.0`** — accessible from any network interface

## Build

```bash
./build.sh
```

Requires [machin](https://github.com/javimosch/machin) and a C compiler (`cc`).

## How it works

Uses machin's **`listen`/`accept`/`read`/`write`/`close`** builtins for networking, **`read_file`** for serving files, **`regex_groups`** for HTTP request parsing, **`base64_decode`** for Basic auth, and **goroutines** (`go`) for concurrent request handling — all in pure MFL, no libc dependencies beyond the socket layer.

## License

MIT
