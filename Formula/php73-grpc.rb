require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Grpc < AbstractPhp73Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.21.2.tgz"
  sha256 "2557dbbfdd6d440a529787bb0a8ecf443e345842afd83f654365e8b27d8b1628"

  def install
    Dir.chdir "grpc-#{version}"
    safe_phpize
    system "./configure", "--enable-grpc=#{HOMEBREW_PREFIX}",
           "--prefix=#{prefix}", phpconfig,
           "CFLAGS=-Ithird_party/boringssl/include"
    system "make"
    prefix.install "modules/grpc.so"
    write_config_file if build.with? "config-file"
  end
end
