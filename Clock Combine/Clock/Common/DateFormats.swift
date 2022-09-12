// (C) 2019, Ralf Ebert - iOS Example Project: Clock
// License: https://opensource.org/licenses/0BSD

import Foundation

struct DateFormats {

    static var timeOnlyFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeStyle = .medium
        df.dateStyle = .none
        df.locale = Locale(identifier: "de_DE_POSIX")
        return df
    }()

}
