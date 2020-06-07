require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Zip < AbstractPhp73Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.19.0.tgz"
  sha256 "582a6bb621e49d93872c2159e2598760ca83bfaafc056c077e32fad97b97f531"
  revision 1


  depends_on "libzip"

  def install
    Dir.chdir "zip-#{version}" unless build.head?

    safe_phpize
    system "./configure", phpconfig
    system "make"
    prefix.install "modules/zip.so"
    write_config_file if build.with? "config-file"
  end
end
