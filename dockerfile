FROM raspbian/fpixel

USER root
WORKDIR /usr/src/app

ADD app ./app


RUN apt-get purge -y libreoffice*
RUN apt-get clean
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get autoremove -y

# Dependencies

RUN apt-get install -y devscripts debhelper cmake libldap2-dev libgtkmm-3.0-dev libarchive-dev \
                        libcurl4-openssl-dev intltool
RUN apt-get install -y build-essential cmake pkg-config libjpeg-dev libtiff5-dev libjasper-dev \
                        libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
                        libxvidcore-dev libx264-dev libgtk2.0-dev libgtk-3-dev \
                        libatlas-base-dev libblas-dev liblapack-dev \
                        gfortran \
                        python3-dev python3-pip python3

# Python dependencies

RUN python3 --version
RUN pip3 install -U pip
RUN pip3 install ecapture

RUN python3 appy.py
# RUN python3
# RUN from ecapture import ecapture as ec
# RUN ec.vidcapture(0,"window_name_Video","Demo2.avi","s")