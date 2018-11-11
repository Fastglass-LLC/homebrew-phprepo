require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72RedisAT42rc < AbstractPhp72Extension
  init
  desc "PHP extension for Redis Release Candidate 4.2"
  homepage "https://github.com/phpredis/phpredis"
  url "https://pecl.php.net/get/redis-4.2.0RC3.tgz"
  sha256 "04627f35db02cbcbbf71d312f2a8eb7db1b864e5b155900eb6f0ae0cefe204ff"
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
