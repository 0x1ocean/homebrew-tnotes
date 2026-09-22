class Tnotes < Formula
  desc "Terminal notes: Markdown files with folders, #tags, [[links]], a mouse-first TUI and a JSON CLI"
  homepage "https://github.com/0x1ocean/tnotes"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "cbaebd33ff44eebbc0d54e5f5f0c855b030eae13dc186df9eb0282c8373a40c4"
    end
    on_intel do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "ec22375a93fe6abd0eab6ec93b056354f453e9c40f013a3e0a54005a56f36081"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f79950b04b9fe98d9614ff0cb4f78d9afe34fecca9e639951d4f67ae8dd5ff3"
    end
    on_intel do
      url "https://github.com/0x1ocean/tnotes/releases/download/v1.3.0/tnotes-1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19fc4d6e3ef3e833dbaac6886f5049500de54b1bba06bad294ccfff8f2bd4623"
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
