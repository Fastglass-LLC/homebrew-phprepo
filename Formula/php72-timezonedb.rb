require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Timezonedb < AbstractPhp72Extension
  init
  desc "Timezone Database to be used with PHP's date & time functions"
  homepage "https://pecl.php.net/package/timezonedb"
  url "https://pecl.php.net/get/timezonedb-2019.2.tgz"
  sha256 "80921bf6a8235925320773a24f23f2b5cdef5948d0e4f468c67384b351f243cc"
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
