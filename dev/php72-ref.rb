require Formula['php72'].path.parent.parent + "Abstract/abstract-php-extension"

class Php72Ref < AbstractPhp72Extension
  init
  desc "Soft and Weak references support for PHP"
  homepage "https://github.com/pinepain/php-ref"
  url "https://github.com/pinepain/php-ref/archive/v0.5.0.tar.gz"
  sha256 "0fd928fd8314f836a97e3833d6c5e15658202d05fe3a0725d793f6e06394cd97"
  head "https://github.com/pinepain/php-ref.git"

  bottle do
    root_url "https://dl.bintray.com/pinepain/bottles-devtools"
    cellar :any_skip_relocation
    sha256 "8520ac0b25fc0dfdfb1994d7cbc39ba7c388ac7ae62f54165adc0657ae53dc52" => :sierra
  end

  def install
    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig

    system "make"
    prefix.install "modules/ref.so"
    write_config_file if build.with? "config-file"
  end
end
