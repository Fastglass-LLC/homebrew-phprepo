require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Zip < AbstractPhp73Extension
  init
  desc "A zip management extension"
  homepage "https://pecl.php.net/package/zip"
  url "https://pecl.php.net/get/zip-1.15.3.tgz"
  sha256 "6766799a8fb09f2990224fc7d40e01737294a515d3ffd8895fa25249c31ba0a7"
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
