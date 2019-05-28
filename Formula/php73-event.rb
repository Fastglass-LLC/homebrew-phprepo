require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Event < AbstractPhp73Extension
  init
  desc "Provides interface to libevent library"
  homepage "https://pecl.php.net/package/event"
  url "https://pecl.php.net/get/event-2.5.1.tgz"
  sha256 "4d4538eb5ac7cca1f18f8b395a7f825e1b67f62b860d8623958ea44417addb42"
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
