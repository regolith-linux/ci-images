# Regolith Deb Builder

This is a container to build Regolith packages for all supported distros and
codenames on GitHub Actions. It contains all the necessary files and dependencies
for [voulage] and [actions] and their corresponding scripts to work.

It supports building containers for multiple versions of Ubuntu and Debian (e.g.
LTS releases and the "latest" release) by specifying them as build arguments for
the Docker container build process:

```bash
$ docker build --build-arg=REFERENCE="ubuntu:<ubuntu-version>" -t ci-ubuntu:<ubuntu-version> .
```

For example, to build a container for "Focal Fossa":

```bash
$ docker build --build-arg=REFERENCE="ubuntu:focal" -t ci-ubuntu:focal .
```

The GitHub Actions for this repository are set up to build all supported releases
in a matrix and push them to GitHub Packages for the consumption in other GitHub
Actions from other repositories.

## Supported Container Registry

The images are pushed to GitHub Container Registry and are accessible under
`regolith-linux` namespace.

## Supported Tags

### Debian

The supported releases of Debian for different CPU architecture.

#### amd64

- `ci-cdebian:bookworm-amd64`
- `ci-debian:testing-amd64`

#### arm64

- `ci-debian:bookworm-arm64`
- `ci-debian:testing-arm64`

### Ubuntu

The supported releases of Ubuntu for different CPU architecture.

#### amd64

- `ci-ubuntu:jammy-amd64`
- `ci-ubuntu:noble-amd64`
- `ci-ubuntu:oracular-amd64`

#### arm64

- `ci-ubuntu:jammy-arm64`
- `ci-ubuntu:noble-arm64`
- `ci-ubuntu:oracular-arm64`

## Example

```bash
docker pull ghcr.io/regolith-linux/ci-debian:bookworm-arm64
```

[voulage]: https://github.com/regolith-linux/voulage
[actions]: https://github.com/regolith-linux/actions
