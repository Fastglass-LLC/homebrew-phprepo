require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Grpc < AbstractPhp72Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.19.0.tgz"
  sha256 "172b8f3d30aa286ce6f3bb89a25ee1aa0976de139233bd14fb36564dd6ef8435"

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
