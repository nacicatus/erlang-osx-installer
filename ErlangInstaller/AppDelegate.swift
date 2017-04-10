//
//  AppDelegate.swift
//  ErlangInstaller
//
//  Created by Juan Facorro on 12/28/15.
//  Copyright © 2015 Erlang Solutions. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var mainMenu: MainMenu!
	
    var mainWindow: ErlangInstallerPreferences!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
		
		// Uncomment to delete userdefaults in OSX El Capitan
  		// let domainName: String = Bundle.main.bundleIdentifier!
  		// Foundation.UserDefaults.standard.removePersistentDomain(forName: domainName)
  		// exit(0)

        Utils.maybeRemovePackageInstallation()
        ReleaseManager.load() {
            self.mainMenu.listenNotifications()
            self.mainMenu.loadReleases()
            self.mainMenu.addStatusItem()
            self.mainMenu.scheduleCheckNewReleases()
        }
        
        let theStoryboard :NSStoryboard? = NSStoryboard(name: "ErlangInstallerPreferences", bundle: nil)
        self.mainWindow = theStoryboard?.instantiateInitialController() as? ErlangInstallerPreferences
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }	
}
