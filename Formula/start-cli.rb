class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "7fcbec995b001bad9fa0f69300b891da092a998a88c9d8c7792f6ae61ca68f21"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "28fae284e30d03270aa62a43ce63d4041087bd00a2b164bccf797fa419f10632"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "653ab8c11b04affd7b5fc0f7271b36e53bdbda2078b38832270a8830d6b07570"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fc35effd5f646e29bb9101befd520af904147d84333bb07454a7f1bfd168734"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
