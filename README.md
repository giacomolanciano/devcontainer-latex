# devcontainer-latex

A comprehensive [devcontainer](https://containers.dev/) base image for academic paper and presentation writing with
LaTeX.

## Usage

Use it as a base image for your own `Dockerfile`:

```Dockerfile
FROM ghcr.io/giacomolanciano/devcontainer-latex:<VERSION>
...
```

In alternative, add a reference to this image directly in your `devcontainer.json`:

```json
{
  "image": "ghcr.io/giacomolanciano/devcontainer-latex:<VERSION>",
  ...
}
```

## License

Distributed under the [MIT License](LICENSE).
