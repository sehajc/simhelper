import ArgumentParser
import ShellOut

struct SimHelper: ParsableCommand {
    @Flag(name: .shortAndLong, help: "Search for a database file")
    var findDatabase: Bool

    @Option(name: .shortAndLong, help: "Name of app to open with e.g. 'Finder', 'Core Data Lab'")
    var openWith: String?

    @Argument(help: "Your app bundle ID")
    var bundleID: String

    func run() throws {
        print("Checking for booted simulators running --> \(bundleID)")
        let sandboxDirectories = try shellOut(to: "xcrun simctl get_app_container booted \(bundleID) data")
            .components(separatedBy: "\n")
        for directory in sandboxDirectories {
            print("Found path:")
            print(directory)
            if let openWith = openWith, findDatabase == false {
                try shellOut(to: "open -a \"\(openWith)\" \"\(directory)\"")
            }
            if findDatabase {
                let databases = try shellOut(to: "find \(directory) -name '*.sqlite' -o -name '*.sql' -o -name '*.realm'")
                .components(separatedBy: "\n")
                for database in databases {
                    print("Found database:")
                    print(database)
                    if let openWith = openWith {
                        try shellOut(to: "open -a \"\(openWith)\" \"\(database)\"")
                    }
                }
            }
        }
    }
}

SimHelper.main()
