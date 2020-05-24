require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php74Redis < AbstractPhp74Extension
  init
  desc "PHP extension for Redis"
  homepage "https://github.com/phpredis/phpredis"
  url "https://pecl.php.net/get/redis-5.2.2.tgz"
  sha256 "9965269ec8da48761873e943b770d7053e7579b2b858af97e582eadc7e6eaa11"
  head "https://github.com/phpredis/phpredis.git"


  depends_on "php74-igbinary"
  depends_on "igbinary" => :build

  def install
    args = []
    args << "--enable-redis-igbinary"
    Dir.chdir "redis-#{version}" unless build.head?

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
