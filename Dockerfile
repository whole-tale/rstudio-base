FROM rocker/geospatial:3.5.1

# Install customized RStudio
ADD http://use.yt/upload/34cebeab /tmp/rstudio-server-1.2.679-amd64.deb
RUN apt-get update -qqy && \
  apt-get install -qy libclang-dev && \
  dpkg -i /tmp/rstudio-server-1.2.679-amd64.deb && \
  rm -rf /tmp/rstudio-server-1.2.679-amd64.deb && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

ADD ROOT /
RUN chown rstudio:rstudio /home/rstudio -R
COPY ./watchdog.py /tmp/watchdog.py
HEALTHCHECK --interval=5s --timeout=15s --start-period=5s CMD python3 /tmp/watchdog.py
