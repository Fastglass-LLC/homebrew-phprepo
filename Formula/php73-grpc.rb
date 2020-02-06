require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Grpc < AbstractPhp73Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.27.0.tgz"
  sha256 "3237f0ed837d46b3d270e566d8fb1f8cb4fa9fd8307f88db64835e47acf895c4"

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
