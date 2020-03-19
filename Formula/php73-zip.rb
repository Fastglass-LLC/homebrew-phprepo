require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Zip < AbstractPhp73Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.18.1.tgz"
  sha256 "08240815eab68d932f74586bdb7f095faf4cc28a3698ea6f1f78498140f32fc0"
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
