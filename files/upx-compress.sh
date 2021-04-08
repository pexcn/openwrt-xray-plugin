#!/bin/bash
set -o pipefail

#
# binaries build commands:
#
# env CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_386
# env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_amd64
# env CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_arm7
# env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_arm64
# env CGO_ENABLED=0 GOOS=linux GOARCH=mips GOMIPS=softfloat go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_mips_sf
# env CGO_ENABLED=0 GOOS=linux GOARCH=mipsle GOMIPS=softfloat go build -v -trimpath -ldflags "-X main.VERSION=$(git describe --tags --abbrev=0) -s -w" -o xray-plugin_linux_mipsle_sf
#

upx arm/xray-plugin_linux_arm7
#upx aarch64/xray-plugin_linux_arm64
upx --best mips/xray-plugin_linux_mips_sf
upx --best mipsel/xray-plugin_linux_mipsle_sf
