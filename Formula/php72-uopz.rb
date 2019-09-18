require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Uopz < AbstractPhp72Extension
  init
  desc "Exposes Zend Engine functionality."
  homepage "http://php.net/manual/en/book.uopz.php"
  url "https://pecl.php.net/get/uopz-6.1.1.tgz"
  sha256 "29e8f50a4a6486ea6e9ba5bea706d1e75153e4d7052407ae27ca74c457b953e6"
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
