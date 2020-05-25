FROM ubuntu:20.04

RUN apt update
RUN apt install -y scons python gcc libc-dev make autoconf libtool g++

WORKDIR /libnxt
COPY . ./

# first we need to build our own version of libusb
RUN cd vendor/libusb-0.1.12 ; ./configure ; make -j $(nproc) CFLAGS="-Wno-error" CXXFLAGS="-Wno-error" install

# now lets build libnxt
RUN scons
RUN mkdir /out && cp fwflash fwexec /out
