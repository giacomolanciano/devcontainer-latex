# devcontainer-latex

A comprehensive [devcontainer](https://containers.dev/) base image for academic paper and presentation writing with
LaTeX.

## Usage

There are multiple alternative ways to use this image:

1. (**Recommended**) Add a reference to this image in your `devcontainer.json`:

    ```json
    {
      "image": "ghcr.io/giacomolanciano/devcontainer-latex:<VERSION>",
      ...
    }
    ```

2. Use it as a base image for your own `Dockerfile`:

    ```Dockerfile
    FROM ghcr.io/giacomolanciano/devcontainer-latex:<VERSION>
    ...
    ```

3. Use it as-is:

    ```bash
    $ docker pull ghcr.io/giacomolanciano/devcontainer-latex:<VERSION>
    ...
    $ docker run -it \
        -u vscode
        -e UID=$(id -u) \
        -e GID=$(id -g) \
        -v </PATH/TO/LATEX/PROJECT>:/workspaces/<LATEX-PROJECT-NAME> \
        -w /workspaces/<LATEX-PROJECT-NAME> \
        --name <CONTAINER-NAME> \
        ghcr.io/giacomolanciano/devcontainer-latex:<VERSION> \
        bash
    ```

Check [**PaperOps**](https://github.com/giacomolanciano/paperops) to see a usage example.

## Acknowledgments

Maintained by [Giacomo Lanciano](https://github.com/giacomolanciano).

## License

Distributed under the [MIT License](LICENSE).
