class SeLaLib < Formula
  desc "Semi-lagrangian library"
  homepage "http://selalib.gforge.inria.fr"
  url "https://gitlab.mpcdf.mpg.de/clapp/selalib.git"

  keg_only ""

  depends_on "cmake" => :build
  depends_on "open-mpi"
  depends_on "fftw"
  depends_on "pnavaro/brews/hdf5-parallel"
  
  fails_with :clang
  env :std
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_BUILD_TYPE=Release", "-DHDF5_PARALLEL_ENABLES=ON", "-DHDF5_ROOT=/usr/local/opt/hdf5-parallel"
      system "make", "install"
    end
  end
end
