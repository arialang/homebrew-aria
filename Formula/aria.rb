class Aria < Formula
  desc "The Aria Programming Language"
  homepage "https://egranata.github.io/aria/"
  license "Apache-2.0"
  version "v0.9.20250918"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arialang/aria/releases/download/v0.9.20250918/aria-0.9.20250918-aarch64-apple-darwin-20250918165231.tgz"
    sha256 "23de60e3d0f044fd0268e40db44c7360c9a21713dd503ca527592c1d582b3483"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/arialang/aria/releases/download/v0.9.20250918/aria-0.9.20250918-x86_64-unknown-linux-gnu-20250918165231.tgz"
    sha256 "e329ecc4e7948239fbb015453e220aa3ab847f64851bfe85e480bce0c03ad827"
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
