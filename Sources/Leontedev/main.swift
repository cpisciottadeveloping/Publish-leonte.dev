import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct Leontedev: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case articles
        //case projects
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://leonte.dev")!
    var name = "build(by dev: Leonte)"
    var description = "Content for people that build."
    var language: Language { .english }
    var imagePath: Path? { nil }
}


let colorsReplacement = StringReplace(
    replacements: [
//        (source: "website-background-color",         target: "#f9f7f7"), // https://colorhunt.co/palette/22272
//        (source: "website-content-background-color", target: "#dbe2ef"),
//        (source: "website-text-color",               target: "#112d4e"),
//        (source: "header-color",                     target: "#dbe2ef"),
//        (source: "navigation-items-color",           target: "#3f72af"), // albastru inchis
//        (source: "navigation-items-text-color",      target: "#f9f7f7"), // aproape alb
        
//        (source: "website-background-color",         target: "#f5f7f2"), // https://colorhunt.co/palette/7642
//        (source: "website-content-background-color", target: "#eaffd0"),
//        (source: "website-text-color",               target: "#000000"),
//        (source: "header-color",                     target: "#95e1d3"),
//        (source: "navigation-items-color",           target: "#000000"),
//        (source: "navigation-items-text-color",      target: "#eaffd0"),
        
        (source: "website-background-color",         target: "#ffffff"), //
        (source: "website-content-background-color", target: "#ececeb"), // chenare
        (source: "website-text-color",               target: "#000000"),
        (source: "header-color",                     target: "#e25822"), // logo
        (source: "navigation-items-color",           target: "#10316b"), // albastru inchis
        (source: "navigation-items-text-color",      target: "#ffffff"), // aproape alb #e4eaf5
        (source: "hover-color",                      target: "#e4eaf5"),
        (source: "video-color",                      target: "#ffffff"),
        
        // ++++++ DARK MODE
        
        (source: "website-background-color-dark",         target: "#222831"),
        (source: "website-content-background-color-dark", target: "#393e46"),
        (source: "website-text-color-dark",               target: "#eeeeee"),
        (source: "header-color-dark",                     target: "#00adb5"),
        (source: "navigation-items-color-dark",           target: "#008A90"),
        (source: "navigation-items-text-color-dark",      target: "#eeeeee"),
        (source: "hover-color-dark",                      target: "#6e5773"),
        (source: "video-color-dark",                      target: "#ffffff"), // 262D39
    ],
    filePaths: [
        "styles.css",
        "social/github.svg",
        "social/twitter.svg",
        "social/CV.svg",
        "social/linkedin.svg",
    ]
)

try Leontedev().publish(
    using: [
        .installPlugin(.splash(withClassPrefix: "")), 
        .copyResources(),
        .addMarkdownFiles(),
        //.sortItems(by: \.date, order: .descending),
        .generateHTML(withTheme: .leontedevTheme(using: navigation, with: projects), indentation: .tabs(1)),
        .stringReplace(colorsReplacement),
        .generateRSSFeed(including: [.articles]),
        .generateSiteMap(),
        //.unwrap(.gitHub("ncreated/ncreated.github.io", useSSH: true), PublishingStep.deploy)
    ]
)
