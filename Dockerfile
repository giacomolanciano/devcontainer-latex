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
        python3-pygments \
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

# Install Microsoft fonts
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -vr

# Install 'latexindent' Perl dependencies
RUN cpanm -fi Log::Dispatch::File YAML::Tiny File::HomeDir
