class Selalib < Formula
  desc "Semi-lagrangian library"
  homepage "http://selalib.gforge.inria.fr"
  head "https://gitlab.mpcdf.mpg.de/clapp/selalib.git", :branch => "develop"

  keg_only ". Try simulations "

  depends_on "cmake" => :build
  depends_on "open-mpi"
  depends_on "fftw"
  
  fails_with :clang
  env :std
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_BUILD_TYPE=Release", "-DHDF5_PARALLEL_ENABLED=ON", "-DHDF5_ROOT=/usr/local/opt/hdf5-parallel", "-DCMAKE_INSTALL_PREFIX=/usr/local/opt/selalib"
      system "make", "install"
    end
  end
end
