// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCRelativeTimer",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCRelativeTimer",
			targets: ["GXUCRelativeTimerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230617144628")
	],
	targets: [
		.target(name: "GXUCRelativeTimerWrapper",
				dependencies: [
					"GXUCRelativeTimer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.watchOS, .iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCRelativeTimer",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCRelativeTimer-1.0.0-beta.20230617144628.xcframework.zip",
			checksum: "d9893b14282df8f97a8d081228d5f5117675031f51d1017e12778f45abd0c0d6"
		)
	]
)