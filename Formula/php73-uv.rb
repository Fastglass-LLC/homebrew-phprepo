require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Uv < AbstractPhp73Extension
  init
  desc "interface to libuv library"
  homepage "https://github.com/bwoebi/php-uv"
  url "https://pecl.php.net/get/uv-0.2.4.tgz"
  sha256 "5ad5906c864ab2f9d856bc0920ca992531a9dd6c4c21189715ecf803821c31b2"
  head "https://github.com/bwoebi/php-uv.git"
  revision 1


  depends_on "libuv"

  def install
    Dir.chdir "uv-#{version}" unless build.head?
    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig,
                          "--with-uv=#{Formula["libuv"].opt_prefix}"
    system "make"
    prefix.install "modules/uv.so"
    write_config_file if build.with? "config-file"
  end
end
