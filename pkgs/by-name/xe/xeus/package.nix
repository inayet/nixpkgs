{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  doctest,
  nlohmann_json,
  libuuid,
  xtl,
}:

stdenv.mkDerivation rec {
  pname = "xeus";
  version = "3.2.0";

  src = fetchFromGitHub {
    owner = "jupyter-xeus";
    repo = "xeus";
    rev = version;
    sha256 = "sha256-D/dJ0SHxTHJw63gHD6FRZS7O2TVZ0voIv2mQASEjLA8=";
  };

  nativeBuildInputs = [
    cmake
    doctest
  ];

  buildInputs = [
    nlohmann_json
    libuuid
    xtl
  ];

  cmakeFlags = [
    "-DXEUS_BUILD_TESTS=ON"
  ];

  doCheck = true;
  preCheck = ''export LD_LIBRARY_PATH=$PWD'';

  meta = with lib; {
    homepage = "https://xeus.readthedocs.io";
    description = "C++ implementation of the Jupyter Kernel protocol";
    license = licenses.bsd3;
    maintainers = with maintainers; [ serge_sans_paille ];
    platforms = platforms.all;
  };
}
