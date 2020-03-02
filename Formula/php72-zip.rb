require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Zip < AbstractPhp72Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.17.2.tgz"
  sha256 "6b411fb8a37c303833e23778375c8acfb7a0ce584b1c817f218e7bc1bb09c39e"
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
