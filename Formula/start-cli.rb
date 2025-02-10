class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin"
      sha256 "f28a31ee12bbbf669d04e16ef60bb89a93631eea699afe7f051d35345af2f649"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin"
      sha256 "f29d5fc2ae8abd28c48ad4a4f4245279e48947c7d7f22f997de1f7b52b35f45c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu"
      sha256 "4b65a34ede46f87d2a46d7c5ada30ff8782d3a40ec9417a2ce7832fc902409e6"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu"
      sha256 "80bc9d8c7214005a1bdc6c1a4f444c4bb423a6f285162ab46a282b0fa2f9c7f8"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
