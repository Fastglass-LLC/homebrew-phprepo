require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Grpc < AbstractPhp72Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.25.0.tgz"
  sha256 "ca1367a32170c2f500c7a8a09db697444ec3f3513d16aff9b6a02efefb85a7a9"

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
