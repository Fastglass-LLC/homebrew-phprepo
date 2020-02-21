require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Swoole < AbstractPhp73Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.4.16.tgz"
  sha256 "04864e1b705c2b62198a5f3890dd3c23f95a4787c97f3c1b086f0367bdaf9a87"
  head "https://github.com/swoole/swoole-src.git"


  def install
    Dir.chdir "swoole-#{version}" unless build.head?
    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--enable-coroutine", phpconfig
    system "make"
    prefix.install "modules/swoole.so"
    write_config_file if build.with? "config-file"
  end
end
