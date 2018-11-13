require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Yaml < AbstractPhp72Extension
  init
  desc "YAML-1.1 parser and emitter"
  homepage "https://pecl.php.net/package/yaml"
  url "https://pecl.php.net/get/yaml-2.0.3.tgz"
  sha256 "a94e3f49b7df748f903fdd22e4acd091b9234f5ba47ca4043c442d7667c7dc3b"
  head "https://github.com/php/pecl-file_formats-yaml.git", :branch => "php7"


  depends_on "libyaml"

  def install
    Dir.chdir "yaml-#{version}" unless build.head?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          "--with-yaml=#{Formula["libyaml"].opt_prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/yaml.so"
    write_config_file if build.with? "config-file"
  end
end
