class Xlifepp < Formula
  desc "extended finite element library developed in C++"
  homepage "https://uma.ensta-paris.fr/soft/XLiFE++/"
  head "https://gitlab.inria.fr/xlifepp/xlifepp.git", :branch => "master"

  keg_only "it is the development version."

  depends_on "cmake" => :build
  depends_on "suite-sparse"
  
  env :std
  
  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end
end
