require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Grpc < AbstractPhp73Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.22.0.tgz"
  sha256 "4bed4b54c729c66c1018cd3afe5570845a1d1ca24c142255e0b8cfdd9c35490f"

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
