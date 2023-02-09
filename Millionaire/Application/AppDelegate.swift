import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let startVC = WinViewController()
        let navigationVC = UINavigationController(rootViewController: startVC)
        let window = UIWindow(frame: UIScreen.main.bounds)
        navigationVC.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
