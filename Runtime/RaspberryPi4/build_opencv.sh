# Intall Python 
sudo apt install python2 python-dev
sudo apt install python-setuptools
sudo apt install cmake
sudo apt-get install libjpeg-dev

# Checkout the desired version (e.g., version 1.20.3)
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py
python -m pip install cython
python -m pip install numpy


# download opencv source code
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 2.4.8
git apply opencv_248.patch

mkdir build
cd build

# set ant home
export ANT_HOME=/usr/share/ant/

# cmake -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DBUILD_PERF_TESTS=OFF -DBUILD_JASPER=ON -DBUILD_JPEG=ON -DBUILD_OPENEXR=OFF -DBUILD_PNG=ON -DBUILD_TBB=OFF -DBUILD_TIFF=ON -DBUILD_ZLIB=ON -DBUILD_FAT_JAVA_LIB=ON  -DENABLE_PRECOMPILED_HEADERS=OFF -DWITH_1394=ON -DWITH_FFMPEG=ON -DWITH_GSTREAMER=ON -DWITH_V4L=ON -DWITH_IPP=OFF -DWITH_CUDA=OFF -DWITH_OPENCL=OFF -DWITH_OPENGL=OFF -DWITH_QT=OFF -DBUILD_WITH_DEBUG_INFO=OFF ..

cmake -D WITH_OPENMP=ON -D BUILD_TIFF=ON -D WITH_FFMPEG=ON -D BUILD_TBB=OFF -D BUILD_TESTS=OFF -D WITH_EIGEN=ON -D WITH_GSTREAMER=ON -D WITH_V4L=ON -Wno-dev -D CMAKE_C_COMPILER=/usr/bin/gcc-7 -D CMAKE_CXX_COMPILER=/usr/bin/g++-7 -DCMAKE_PREFIX_PATH:PATH=../3rdparty/ -DCMAKE_INSTALL_PREFIX=../3rdparty/libjasper -DENABLE_PRECOMPILED_HEADERS=OFF ..

make -j4
sudo make install

# cp lib/libopencv_java248.so to StormCV/stormcv/src/main/resources

