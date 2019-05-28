require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Uopz < AbstractPhp73Extension
  init
  desc "Exposes Zend Engine functionality."
  homepage "http://php.net/manual/en/book.uopz.php"
  url "https://pecl.php.net/get/uopz-6.1.0.tgz"
  sha256 "09e983fe3dd24a9c48b11fea66ee4d0d9c5ba3ad9c7716c72d8fbeb7d30994a1"
  head "https://github.com/krakjoe/uopz.git"


  def install
    safe_phpize
    Dir.chdir "uopz-#{version}" unless build.head?
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/uopz.so"
    write_config_file if build.with? "config-file"
  end

  def caveats
    caveats = super

    caveats << "  *\n"
    caveats << "  * Important note:\n"
    caveats << "  * Make sure #{config_scandir_path}/#{config_filename} is loaded\n"
    caveats << "  * after #{config_scandir_path}/ext-opcache.ini. Like renaming\n"
    caveats << "  * ext-opcache.ini to opcache.ini.\n"
  end
end
