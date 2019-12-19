require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Grpc < AbstractPhp73Extension
  init
  desc "The PHP extension for the gRPC library"
  homepage "https://grpc.io"
  url "https://pecl.php.net/get/grpc-1.26.0.tgz"
  sha256 "519bc3312937b7f203bc0228099f10056a59aadd5cc09e5d9160aa96c89f3098"

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
