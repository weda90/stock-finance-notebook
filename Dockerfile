FROM jupyter/minimal-notebook:latest
LABEL Name=stockfinancenotebook Version=0.0.1
LABEL maintainer="Weda Dewa <weda.dewa@yahoo.co.id>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

RUN "wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz"
RUN "tar -xzf ta-lib-0.4.0-src.tar.gz"
RUN "cd ta-lib/"
RUN "./configure --prefix=/usr"
RUN "make"
RUN "sudo make install"

USER ${NB_UID}

RUN "pip install yfinance TA-Lib backtrader backtesting"
