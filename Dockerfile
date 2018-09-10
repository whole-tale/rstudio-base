FROM rocker/ropensci:3.4.1

ADD ROOT /
RUN chown rstudio:rstudio /home/rstudio -R
