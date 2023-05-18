# Container images

## Mission statement

The goal of this project is to support [semantically versioned](https://semver.org/), [rootless](https://rootlesscontaine.rs/), and [multiple architecture](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) containers for various applications.

This project is based on the work of onedr0p and the k8s@home community, and extending the base image and containers I make use of.

## Tag immutability

The containers built here do not use immutable tags, instead pinning the tag to the sha256 digest of the image.

| Container                                           |  Immutable  |
|-----------------------------------------------------|-------------|
| `ghcr.io/tkpegatron/alpine:rolling`                   | ❌         |
| `ghcr.io/tkpegatron/alpine:3.16`                      | ❌         |
| `ghcr.io/tkpegatron/alpine:rolling@sha256:8053...`    | ✅         |
| `ghcr.io/tkpegatron/alpine:3.16@sha256:8053...`       | ✅         |

## Credits

A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors.

