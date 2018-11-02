require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Timezonedb < AbstractPhp72Extension
  init
  desc "Timezone Database to be used with PHP's date & time functions"
  homepage "https://pecl.php.net/package/timezonedb"
  url "https://pecl.php.net/get/timezonedb-2018.7.tgz"
  sha256 "b66ea7b903b47fdf85cfe7f6089dd3b8b766a9d74d171a657b20492a08b2e974"
  head "https://svn.php.net/repository/pecl/timezonedb/trunk/"
  revision 1


  def install
    Dir.chdir "timezonedb-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/timezonedb.so"
    write_config_file if build.with? "config-file"
  end
end
