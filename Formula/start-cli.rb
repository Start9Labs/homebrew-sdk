class StartCli < Formula
  desc "CLI for StartOS interaction"
  homepage "https://start9.com"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-apple-darwin.tar.gz"
      sha256 "41618eb66f0182cd420d744c805bbf1b75939aca8dc0b8898aeaf0e3d98e9e27"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c5ee1bf7c83aeeb73e912b1b758ae4a82f6c4b049bfb2b15e146b2258fbe8e3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d5d737345032a968ff3051211696443e49601df11eae47d8be96e4ed4d35fab"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha14/start-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0dbf1c090bf2979656f5a02d344cf24955cf9d5eefa49fab14ff65c63c99fa74"
    end
  end

  def install
    bin.install Dir["*"].first => "start-cli"
  end

  test do
    assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
  end
end
