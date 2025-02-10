class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "5794bafb37dd18148f1fb378cfcc92d2ec3b0959adfff601f501d4c9c96d8cca"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "1d405df8208ff349a4c8f6aa6bb172a3103d0043476a876c5c59c57a01ed3abc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c89b4d7f27c6a455a073884a8a56f6f17a7539bc325d6efb89f4e9b4bf40101c"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1defd10b011a2127f197deb377e7a1991a15c3c60f780aa9d5ebc82e3f2dc81e"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
