require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72RedisAT42rc < AbstractPhp72Extension
  init
  desc "PHP extension for Redis Release Candidate 4.2"
  homepage "https://github.com/phpredis/phpredis"
  url "http://pecl.php.net/get/redis/4.2.0RC1"
  sha256 "ee07c2b5c0721b14aa8dee5488c3b1414a1ebbc410e0869af913b80ac02d5178"
  head "https://github.com/phpredis/phpredis.git"


  depends_on "php72-igbinary"
  depends_on "igbinary" => :build

  def install
    args = []
    args << "--enable-redis-igbinary"

    safe_phpize

    # Install symlink to igbinary headers inside memcached build directory
    (Pathname.pwd/"ext").install_symlink Formula["igbinary"].opt_include/"php5" => "igbinary"

    system "./configure", "--prefix=#{prefix}", phpconfig, *args
    system "make"

    prefix.install "modules/redis.so"

    write_config_file if build.with? "config-file"
  end

  def config_file
    super + <<~EOS

      ; phpredis can be used to store PHP sessions.
      ; To do this, uncomment and configure below
      ;session.save_handler = redis
      ;session.save_path = "tcp://host1:6379?weight=1, tcp://host2:6379?weight=2&timeout=2.5, tcp://host3:6379?weight=2"
    EOS
  end
end
