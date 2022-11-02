ARG VARIANT=ubuntu-22.04
FROM mcr.microsoft.com/devcontainers/base:${VARIANT}

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        bash-completion \
        biber \
        bibtool \
        cpanminus \
        fontconfig \
        latexmk \
        make \
        poppler-utils \
        texlive-bibtex-extra \
        texlive-extra-utils \
        texlive-font-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-publishers \
        texlive-science \
        xzdec \
    && rm -rf /var/lib/apt/lists/*

# Install 'latexindent' Perl dependencies
RUN cpanm -fi Log::Dispatch::File YAML::Tiny File::HomeDir
