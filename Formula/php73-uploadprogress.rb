require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Uploadprogress < AbstractPhp73Extension
  init
  desc "An extension to track progress of a file upload"
  homepage "https://github.com/php/pecl-php-uploadprogress"
  url "https://pecl.php.net/get/uploadprogress-1.1.0.tgz"
  sha256 "086ff9e52e8851f068254d5bf62e0128fc047c25ff2f6eff00ac89425ab81412"
  revision 1

  def install
    Dir.chdir "uploadprogress-#{version}" unless build.head?

    safe_phpize
    system "./configure", phpconfig
    system "make"
    prefix.install "modules/uploadprogress.so"
    write_config_file if build.with? "config-file"
  end
end
