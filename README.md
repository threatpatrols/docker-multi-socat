# Multi-socat on Docker

Creates multiple socat pipes based on env-var names that start with 'MULTI_SOCAT'

## Usage

Better docs someday...

Env-vars with prefix `MULTI_SOCAT` are sorted and used as `socat` command line inputs.

```yaml
services:
  my-multi-socat:
    image: "threatpatrols/multi-socat"
    environment:
      MULTI_SOCAT_02: "TCP4-LISTEN:2222,reuseaddr,fork TCP4:127.0.0.1:22"
      MULTI_SOCAT_01: "UNIX-LISTEN:/run/docker.sock,reuseaddr,fork TCP4:127.0.0.1:80"
```

## Source / Repo
* source: https://github.com/threatpatrols/docker-multi-socat
* repo: https://hub.docker.com/r/threatpatrols/multi-socat
