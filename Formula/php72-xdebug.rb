require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Xdebug < AbstractPhp72Extension
  init
  desc "Provides debugging and profiling capabilities."
  homepage "https://xdebug.org"
  url "https://pecl.php.net/get/xdebug-2.9.2.tgz"
  sha256 "158cce5ff44411128701227ada80933cbd4b03c241a3d0695a309098b3eecc69"
  head "https://github.com/xdebug/xdebug.git"


  def extension_type
    "zend_extension"
  end

  def install
    Dir.chdir "xdebug-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--enable-xdebug"
    system "make"
    prefix.install "modules/xdebug.so"
    write_config_file if build.with? "config-file"
  end
end
