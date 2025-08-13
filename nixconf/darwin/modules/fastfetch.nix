{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  darwin,
}:
  stdenv.mkDerivation {
    pname = "Fastfetch";
    version = "2.49.0";

    src = fetchFromGitHub {
      owner = "fastfetch-cli";
      repo = "fastfetch";
      rev = "2.49.0";
      sha256 = "sha256-M1/VThHWRB6MbmPpHcgaM3j07kmuj0RnjblKo54RatY=";
    };

    nativeBuildInputs = [ cmake ];
    buildInputs = [ 
    ] ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      IOKit
      IOBluetoothUI
      CoreDisplay
      AVFoundation
      DisplayServices
      MediaRemote
      CoreWLAN
      OpenCL
      OpenGL
    ]);
  }
