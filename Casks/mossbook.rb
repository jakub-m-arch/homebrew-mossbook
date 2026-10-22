# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.4.0, ccd1b10edbf06d400e4ffdd777a9ac04ed17be63b49f948825d75969619c438f, af3a1b01e5f38559c0ee11873af40774d736b264ea1c482f1fa6ef013fe42a6d.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "ccd1b10edbf06d400e4ffdd777a9ac04ed17be63b49f948825d75969619c438f",
         intel: "af3a1b01e5f38559c0ee11873af40774d736b264ea1c482f1fa6ef013fe42a6d"

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
