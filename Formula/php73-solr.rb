require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php73Solr < AbstractPhp73Extension
  init
  desc "Fast and lightweight library to communicate with Apache Solr servers"
  homepage "https://pecl.php.net/package/solr"
  url "https://pecl.php.net/get/solr-2.5.0.tgz"
  sha256 "f34c6159515bf229a6f72aab374c40d8dfc9c51d74f0d11fe30a611cbdb5c546"
  head "https://git.php.net/repository/pecl/search_engine/solr.git"

  def install
    Dir.chdir "solr-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/solr.so"
    write_config_file if build.with? "config-file"
  end
end
