require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Grpc < AbstractPhp73Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.21.3.tgz"
  sha256 "5b3f3e363279fc8bc5cde511ed75261f09c404dd94737ef96815ca66ef7877d3"

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
