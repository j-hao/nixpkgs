{ stdenv, fetchzip }:

let
  version = "2.030";
in fetchzip {
  name = "source-code-pro-${version}";

  url = https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip;

  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.otf -d $out/share/fonts/opentype
  '';

  sha256 = "0d8qwzjgnz264wlm4qim048z3236z4hbblvc6yplw13f6b65j6fv";

  meta = {
    description = "A set of monospaced OpenType fonts designed for coding environments";
    maintainers = with stdenv.lib.maintainers; [ relrod ];
    platforms = with stdenv.lib.platforms; all;
    homepage = https://blog.typekit.com/2012/09/24/source-code-pro/;
    license = stdenv.lib.licenses.ofl;
  };
}
