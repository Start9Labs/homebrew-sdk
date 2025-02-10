class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "f614f1244be5e59123070bbfe1d2b486677cf580871725cbadceb7e2ea7867be"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "dd902aff90434ab17bc2d0580bfb9146712d6db970a5218e458f6676d473280d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1796795b4549e8c3232b9a1017cb0227ecda5e2bdb4967035d471340627074d9"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2acbf7054ceb204a5a6dd10249bef225209aedfec730fc107f540feadc8f1255"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
