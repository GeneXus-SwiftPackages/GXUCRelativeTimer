// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCRelativeTimer",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCRelativeTimer",
			targets: ["GXUCRelativeTimerWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.1.0-rc.25")
	],
	targets: [
		.target(name: "GXUCRelativeTimerWrapper",
				dependencies: [
					"GXUCRelativeTimer",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .watchOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCRelativeTimer",
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCRelativeTimer-2.1.0-rc.25.xcframework.zip",
			checksum: "a9017843b59b9a03c2b49909e049e2d14b0c5fd5237d53dc2904fe078756d2d2"
		)
	]
)