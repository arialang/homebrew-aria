class Aria < Formula
  desc "The Aria Programming Language"
  homepage "https://egranata.github.io/aria/"
  license "Apache-2.0"
  version "v0.9.20251013"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arialang/aria/releases/download/v0.9.20251013/aria-0.9.20251013-aarch64-apple-darwin-20251013222819.tgz"
    sha256 "7c633b831114dd10454acbb601d5ef9b036c4a2e638302396bbed24cb75e6430"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/arialang/aria/releases/download/v0.9.20251013/aria-0.9.20251013-x86_64-unknown-linux-gnu-20251013222823.tgz"
    sha256 "0ee1391aee2fb97affe51723c55c932ca30d8ef9bf4e26adc59f711a6387dd72"
  else
    odie "Aria is not supported on your system (unsupported OS or CPU architecture)"
  end

  def install
    bin.install Dir["bin/*"] if Dir.exist?("bin")
    lib.install Dir["lib/*"] if Dir.exist?("lib")
    (share/"aria").install Dir["share/*"] if Dir.exist?("share")
  end

  test do
    system "#{bin}/aria", "--version"
  end
end
