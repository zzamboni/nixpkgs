{ stdenv, lib, fetchurl, pcre, openssl, lmdb }:

stdenv.mkDerivation rec {
  name = "cfengine-${version}";
  version = "3.10.2";
  
  src = fetchurl {
    url = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${name}.tar.gz";
    sha256 = "d4fa9ac7276dba7b85d6757aab2f0929ab8d3b115cb0e7b0cf984760347429d7";
  };
  
  nativeBuildInputs = [ pcre openssl lmdb ];

  meta = with stdenv.lib; {
    description = "Help manage and understand IT infrastructure";
    homepage = https://cfengine.com/;
    license = licenses.gpl3;
    maintainers = with maintainers; [ zzamboni ];
    platforms = with platforms; darwin;
  };
  
}
