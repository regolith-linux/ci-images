# Regolith Deb Builder

This is a container to build Regolith packages for all supported Ubuntu releases on GitHub Actions. It contains all the necessary files and dependencies for [regolith-builder](https://github.com/regolith-linux/regolith-builder) and its scripts.

It supports building containers for multiple versions of Ubuntu (e.g. LTS releases and the "latest" release) by specifying them as build arguments for the Docker container build process:

```
$ docker build --build-arg=REFERENCE="ubuntu:<ubuntu-version>" -t regolith-deb-builder:<ubuntu-version> .
```

For example, to build a container for "Focal Fossa":

```
$ docker build --build-arg=REFERENCE="ubuntu:focal" -t regolith-deb-builder:focal .
[...]
```

The GitHub Actions for this repository are set up to build all supported releases in a matrix and push them to GitHub Packages for the consumption in other GitHub Actions from other repositories.