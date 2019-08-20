require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Grpc < AbstractPhp72Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.23.0.tgz"
  sha256 "c7eb700d3800c1eb229dfa6befe142cd1eff518c2d76b3578d7910a2fcdc27eb"

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
