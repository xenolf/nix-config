{stdenv, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "ov";
  version = "0.13.0";

  src = fetchFromGitHub {
    owner = "noborus";
    repo = "ov";
    rev = "${version}";
    sha256 = null;
  };

  vendorSha256 = null;

  meta = with lib; {
    description = "ov is a terminal pager";
    homepage = "https://noborus.github.io/ov";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}