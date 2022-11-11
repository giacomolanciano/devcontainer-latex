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

# Install additional fonts
## Microsoft
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -vr

## Dependencies for 'auriga' (beamer) & 'gemini' (beamerposter) themes. See:
## - https://github.com/anishathalye/auriga
## - https://github.com/anishathalye/gemini
RUN cd /usr/share/fonts/truetype \
    && \
        for font in hack lato raleway; do \
            mkdir ${font}; \
            wget -O ${font}.zip https://www.fontsquirrel.com/fonts/download/${font}; \
            unzip -n -d ${font} ${font}.zip; \
            rm ${font}.zip; \
        done \
    && fc-cache -vr

# Install 'latexindent' Perl dependencies
RUN cpanm -fi Log::Dispatch::File YAML::Tiny File::HomeDir
