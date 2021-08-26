.DEFAULT: default-target

default-target: generate-project

generate-project:
	@echo "🛫 Generating the Xcode project!"
	xcodegen
	@echo "🛫 Ready for takeoff!"
	xed 1K.xcodeproj

setup: install-brew install-from-brewfile

install-brew:
ifneq (,$(findstring /brew,$(shell command -v brew)))
	@echo "✨ Homebrew is already installed!"
else
	@echo "🍺 Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
endif

install-from-brewfile:
	@echo "🍺 Installing Homebrew dependencies!"
	brew bundle install

.PHONY: default-target generate-project setup install-brew install-from-brewfile
