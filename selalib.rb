class Selalib < Formula
  desc "Semi-lagrangian library"
  homepage "http://selalib.gforge.inria.fr"
  head "https://gitlab.mpcdf.mpg.de/clapp/selalib.git", :branch => "develop"

  keg_only "\n - Copy the simulation directory: \n $ cp -r /usr/local/opt/selalib/bin/selalib_simulations/parallel/bsl_vp_1d1v_cart . \n $ cd bsl_vp_1d1v_cart \n - Run simulation \n $ mpirun -np 4 ./sim_bsl_vp_1d1v_cart vpsim2d_cartesian_input \n - Run included gnuplot script \n $ gnuplot --persist vpsim2d_cartesian.gnu "

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
