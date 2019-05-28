require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Ev < AbstractPhp73Extension
  init
  desc "interface to libev library"
  homepage "https://pecl.php.net/package/ev"
  url "https://pecl.php.net/get/ev-1.0.6.tgz"
  sha256 "104b88c40cc708fd418882166722408c2e429331a2633ef5fa296f497995e2cf"
  head "https://bitbucket.org/osmanov/pecl-ev.git"


  depends_on "libev"

  def install
    Dir.chdir "ev-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-libev=#{Formula["libev"].opt_prefix}"
    system "make"
    prefix.install "modules/ev.so"
    write_config_file if build.with? "config-file"
  end
end
