require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php74Swoole < AbstractPhp74Extension
  init
  desc "Event-driven asynchronous & concurrent networking engine for PHP."
  homepage "https://pecl.php.net/package/swoole"
  url "https://pecl.php.net/get/swoole-4.4.17.tgz"
  sha256 "3276b06c648599196f6b477b656542fadeb15e0573cdc1b6121df727636608c1"
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