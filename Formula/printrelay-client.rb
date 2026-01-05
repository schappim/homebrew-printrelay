class PrintrelayClient < Formula
  desc "Cloud print relay client - connects local printers to PrintRelay server"
  homepage "https://github.com/schappim/print-relay"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/schappim/print-relay/releases/download/v1.1.0/printrelay-client-darwin-amd64.tar.gz"
      sha256 "fcf024f924f0347645e60c5d275ad6cc3acfaa15ba776ce89eef5de9bf22ad81"

      def install
        bin.install "printrelay-client-darwin-amd64" => "printrelay-client"
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/schappim/print-relay/releases/download/v1.1.0/printrelay-client-darwin-arm64.tar.gz"
      sha256 "320bd9033b36ea0aab87f937f66dd6b352358d99bf4a2c0e7d6ae1412386ea6b"

      def install
        bin.install "printrelay-client-darwin-arm64" => "printrelay-client"
      end
    end
  end

  def caveats
    <<~EOS
      To start the PrintRelay client, run:

        printrelay-client -server "wss://your-server.com/ws" -key "YOUR_CLIENT_KEY"

      The client will discover local printers via CUPS and make them available
      through your PrintRelay server.

      For more information, see:
        https://github.com/schappim/print-relay#client-setup
    EOS
  end

  test do
    system "#{bin}/printrelay-client", "-h"
  end
end
