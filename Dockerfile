FROM rocker/ropensci:3.4.1

ADD ROOT /
RUN chown rstudio:rstudio /home/rstudio -R
COPY ./watchdog.py /tmp/watchdog.py
HEALTHCHECK --interval=5s --timeout=15s --start-period=5s CMD python3 /tmp/watchdog.py
