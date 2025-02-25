class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  version "0.3.6"
  revision "alpha15"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha15/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "84df850d6be52ef1aa6f47a458dbdf91dca6cca88a9fb0e3d600a666a7d5e0fc"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha15/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "353fc66d4b027bc8674575dc4bafdb31f5b9be4f98bc9c5aa1a392c7b16498cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha15/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ad29d34e8281dec9c5ea6969881a178bef0b5748052c039b3da3997eed9e209"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha15/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34f7d854ddb43e15b82a0806ba463dd2adc10c205c927ac8f6ce745983598e91"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
