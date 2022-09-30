FROM ubuntu:18.04

WORKDIR /opt
COPY . /opt

USER root

RUN apt-get update 
RUN apt-get install -y python3.6-dev \
                       python3-pip \
                       wget \
                       gdal-bin \
                       libgdal-dev \
                       libspatialindex-dev \
                       build-essential \
                       software-properties-common \
                       apt-utils \
                       libgl1-mesa-glx \
                       ffmpeg \
                       libsm6 \
                       libxext6 \
                       libffi-dev \
                       libbz2-dev \
                       zlib1g-dev \
                       libreadline-gplv2-dev \
                       libncursesw5-dev \
                       libssl-dev \
                       libsqlite3-dev \
                       tk-dev \
                       libgdbm-dev \
                       libc6-dev \
                       liblzma-dev

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt-get update
RUN apt-get install -y libgdal-dev
RUN pip3 install cython
RUN pip3 install --upgrade cython
RUN pip3 install setuptools==59.6.0
RUN pip3 install GDAL==3.0.4
RUN pip3 install numpy==1.19.5
RUN pip3 install matplotlib==3.3.4
RUN pip3 install pandas==1.1.5
RUN wget http://download.osgeo.org/libspatialindex/spatialindex-src-1.7.1.tar.gz
RUN tar -xvf spatialindex-src-1.7.1.tar.gz
RUN cd spatialindex-src-1.7.1/ && ./configure && make && make install
RUN ldconfig                       
RUN add-apt-repository ppa:ubuntugis/ppa
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev

RUN pip3 install ExifRead==2.3.1
RUN pip3 install gpsphoto==2.2.3
RUN pip3 install imageio==2.9.0
RUN pip3 install networkx==2.5
RUN pip3 install opencv-python==3.4.2.16
RUN pip3 install opencv-contrib-python==3.4.2.16
RUN pip3 install piexif==1.1.3
RUN pip3 install Pillow==8.3.2
RUN pip3 install pytz==2020.1
RUN pip3 install PyWavelets==1.1.1
RUN pip3 install scikit-image==0.17.2
RUN pip3 install scikit-learn==0.23.2
RUN pip3 install scipy==1.5.4
RUN pip3 install six==1.15.0
RUN pip3 install sklearn==0.0
RUN pip3 install tifffile==2020.9.3

RUN pip3 install tqdm==4.50.2
RUN pip3 install detecto==1.2.1

RUN apt-get install -y libgl1-mesa-dev

RUN pip3 install open3d==0.13.0
RUN pip3 install utm==0.6.0
RUN pip3 install tensorflow==2.6.0
RUN pip3 install keras==2.6.0
