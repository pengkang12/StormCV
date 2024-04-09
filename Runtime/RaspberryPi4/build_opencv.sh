# Intall Python 
sudo apt install python2 python-dev
sudo apt install python-setuptools
sudo apt install cmake

# Checkout the desired version (e.g., version 1.20.3)
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
python -m pip install cython
python -m pip install numpy

mkdir build
cd build

# set ant home
export ANT_HOME=/usr/share/ant/

cmake -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_JASPER=OFF -DBUILD_JPEG=ON -DBUILD_OPENEXR=OFF -DBUILD_PNG=ON -DBUILD_TBB=OFF -DBUILD_TIFF=ON -DBUILD_ZLIB=ON -DBUILD_FAT_JAVA_LIB=ON  -DENABLE_PRECOMPILED_HEADERS=OFF -DWITH_1394=OFF -DWITH_FFMPEG=ON -DWITH_GSTREAMER=ON -DWITH_V4L=ON -DWITH_TBB=ON -DWITH_IPP=OFF -DWITH_CUDA=OFF -DWITH_OPENCL=OFF -DWITH_OPENGL=OFF -DWITH_QT=OFF -DBUILD_WITH_DEBUG_INFO=OFF ..

make -j4
sudo make install
