require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Zip < AbstractPhp72Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.19.2.tgz"
  sha256 "4088150113e2a85b418563757f3c3d164a7fabc0af13282c5429a06211afa85c"
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
