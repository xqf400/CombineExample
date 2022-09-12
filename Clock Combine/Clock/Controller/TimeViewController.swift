// (C) 2019, Ralf Ebert - iOS Example Project: Clock
// License: https://opensource.org/licenses/0BSD

import Combine
import UIKit

func systemTimePublisher() -> AnyPublisher<Date, Never> {
    Timer.publish(every: TimeInterval(1), on: .main, in: .default)
        .autoconnect()
        .eraseToAnyPublisher()
}

class TimeViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        systemTimePublisher()
            .map { date in DateFormats.timeOnlyFormatter.string(from: date) }
            .sink { [weak self] (text) in
                self?.timeLabel.text = "Zeit \(text)"
                print("update time: \(text)") //every second
            }
            .store(in: &self.subscriptions)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("disappear stop subscription")
        self.subscriptions.removeAll()
    }
    
}
