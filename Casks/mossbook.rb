# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.1.0, ab459d35b4359e80bf5548cb87c8a3c194cd286cce8f7ae0e12fb18651e53616, 036050af1684ab46a107c3528f8ad5796c2f426531c9c213c3df47f8b0860b6d.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "ab459d35b4359e80bf5548cb87c8a3c194cd286cce8f7ae0e12fb18651e53616",
         intel: "036050af1684ab46a107c3528f8ad5796c2f426531c9c213c3df47f8b0860b6d"

  url "https://github.com/jakub-m-arch/mossbook/releases/download/v#{version}/Mossbook_#{version}_#{arch}.dmg"
  name "Mossbook"
  desc "Private, offline well-being journal"
  homepage "https://github.com/jakub-m-arch/mossbook"

  depends_on :macos

  app "Mossbook.app"

  # No `zap` stanza on purpose: the app's data folder is the user's journal and
  # must never be removed by an uninstall command.

  caveats <<~EOS
    Mossbook is not notarized yet. The first time, right-click the app and choose
    Open (or allow it in System Settings > Privacy & Security).

    Your journal stays in ~/Library/Application Support/io.github.jakubmarch.mossbook
    when you uninstall. Keep a backup (Settings > Backup) before deleting it by hand.
  EOS
end
