class StartCli < Formula
    desc "CLI for StartOS interaction"
    homepage "https://start9.com"
    
    if Hardware::CPU.arm?
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha13/start-cli-aarch64-apple-darwin"
      sha256 "49d07ae30f269dd2b495bad3fe96e981396ce02fe61b72f999ece629c925ca04"
    else
      url "https://github.com/start9labs/start-cli/releases/download/v0.3.6-alpha13/start-cli-x86_64-apple-darwin"
      sha256 "49d07ae30f269dd2b495bad3fe96e981396ce02fe61b72f999ece629c925ca04"
    end
  
    def install
      bin.install Dir["*"].first => "start-cli"
      system "xattr", "-d", "com.apple.quarantine", "#{bin}/start-cli"
    end
  
    test do
      assert_match "start-cli version will not work because Aiden broke it! ;)", shell_output("#{bin}/start-cli git-info")
    end
  end
  