require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Oauth < AbstractPhp72Extension
  init
  desc "OAuth 1.0 consumer and provider"
  homepage "https://pecl.php.net/package/oauth"
  url "https://pecl.php.net/get/oauth-2.0.5.tgz"
  sha256 "c3fdd6ff8e6912832409beab58f2817ece83a6806c79f2f7b1707c98d595e0a7"
  head "https://github.com/php/pecl-web_services-oauth.git"
  revision 1


  depends_on "pcre"

  def install
    Dir.chdir "oauth-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/oauth.so"
    write_config_file if build.with? "config-file"
  end
end
