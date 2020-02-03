require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Zip < AbstractPhp73Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.17.1.tgz"
  sha256 "74d8cdbb0045104d592cb3e41f0ca790520db168f34014a2c4bf227738381de6"
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
