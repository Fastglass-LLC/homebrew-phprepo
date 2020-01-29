require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Uploadprogress < AbstractPhp73Extension
  init
  desc "An extension to track progress of a file upload"
  homepage "https://github.com/php/pecl-php-uploadprogress"
  url "https://pecl.php.net/get/uploadprogress-1.1.3.tgz"
  sha256 "bcbf96631d257113ef7e85d21870d9b937bed9e00d68a6f1c0accab089af0e69"
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
