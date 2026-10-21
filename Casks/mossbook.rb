# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.3.0, 7e7ad1ac05b06a97d5cbbe4d9cd202361d96c025ded26d61cca6106095ac7e86, c787a58d966a6a442116b27766595fbe8fd7a4f7de7e2ed3e23d0a0c401e2b37.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "7e7ad1ac05b06a97d5cbbe4d9cd202361d96c025ded26d61cca6106095ac7e86",
         intel: "c787a58d966a6a442116b27766595fbe8fd7a4f7de7e2ed3e23d0a0c401e2b37"

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
