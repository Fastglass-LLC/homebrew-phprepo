require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Timezonedb < AbstractPhp72Extension
  init
  desc "Timezone Database to be used with PHP's date & time functions"
  homepage "https://pecl.php.net/package/timezonedb"
  url "https://pecl.php.net/get/timezonedb-2018.9.tgz"
  sha256 "661364836f91ec8b5904da4c928b5b2df8cb3af853994f8f4d68b57bc3c32ec8"
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
