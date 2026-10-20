# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.1.2, 14d0f7173602cea3ebbf195a097ba4d7c056232f08e1338fa2101f9200133654, 80c0cbb502bb43213f46e8d252a8d0a6e2509edbb5217af5f5021bd1ab66326b.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "14d0f7173602cea3ebbf195a097ba4d7c056232f08e1338fa2101f9200133654",
         intel: "80c0cbb502bb43213f46e8d252a8d0a6e2509edbb5217af5f5021bd1ab66326b"

  url "https://github.com/jakub-m-arch/mossbook/releases/download/v#{version}/Mossbook_#{version}_#{arch}.dmg"
  name "Mossbook"
  desc "Private, offline well-being journal"
  homepage "https://github.com/jakub-m-arch/mossbook"

  depends_on :macos

  app "Mossbook.app"

  # Mossbook is not notarized yet. Without this, macOS refuses to open the
  # downloaded app ("damaged" or "cannot be verified"). Homebrew has already
  # checked the download's SHA-256 against this cask before installing it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mossbook.app"]
  end

  # No `zap` stanza on purpose: the app's data folder is the user's journal and
  # must never be removed by an uninstall command.

  caveats <<~EOS
    Your journal stays in ~/Library/Application Support/io.github.jakubmarch.mossbook
    when you uninstall. Keep a backup (Settings > Backup) before deleting it by hand.
  EOS
end
