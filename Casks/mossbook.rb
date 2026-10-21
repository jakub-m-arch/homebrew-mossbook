# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.2.0, c903ec10c0d4fe0c0280798341125802e3581158afcfee80ce8b60dc5eb42108, 9cd4797ce4f1c552eda479506a219f740373d7caf44a21535746b654e3923319.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "c903ec10c0d4fe0c0280798341125802e3581158afcfee80ce8b60dc5eb42108",
         intel: "9cd4797ce4f1c552eda479506a219f740373d7caf44a21535746b654e3923319"

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
