class Tnotes < Formula
  desc "Terminal notes: Markdown files with folders, #tags, [[links]], a mouse-first TUI and a JSON CLI"
  homepage "https://github.com/0x1ocean/tnotes"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "5046e8b7fabf1138e772bdfa9e11fd669633127ab98f47629266d989917aedb4"
    end
    on_intel do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a802a474d25825467aa2aec31b4d19f068bb60388220a354ee350c86d6a01137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9d556f5f4f97f1bc933efa000d2f2f5fa53218312e9cfbc50b864857d06be39"
    end
    on_intel do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "174454dba8d9b6040fe0e0c1da1eb8bcf1a209e5ea9fd8914e8bdb08e790a50f"
    end
  end

  def install
    bin.install "tnotes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tnotes --version")
    system bin/"tnotes", "--dir", testpath/"vault", "new", "Brew test"
    assert_match "Brew test", shell_output("#{bin}/tnotes --dir #{testpath}/vault ls")
  end
end
