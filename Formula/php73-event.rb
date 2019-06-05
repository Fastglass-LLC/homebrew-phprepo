require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Event < AbstractPhp73Extension
  init
  desc "Provides interface to libevent library"
  homepage "https://pecl.php.net/package/event"
  url "https://pecl.php.net/get/event-2.5.2.tgz"
  sha256 "8edd69354177351a910b2855f112e2914a83e56cc2e2cb5ed03f33e73d5f3f2d"
  head "https://bitbucket.org/osmanov/pecl-event.git"
  revision 1


  depends_on "libevent"
  depends_on "openssl"

  def install
    Dir.chdir "event-#{version}" unless build.head?

    args = []
    args << "--with-event-core"
    args << "--with-event-extra"
    args << "--enable-event-debug"
    args << "--with-event-libevent-dir=#{Formula["libevent"].opt_prefix}"
    args << "--with-event-openssl"
    args << "--with-openssl-dir=#{Formula["openssl"].opt_prefix}"

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig, *args
    system "make"
    prefix.install "modules/event.so"
    write_config_file if build.with? "config-file"
  end
end
