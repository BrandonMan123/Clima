//
//  SettingsViewController.swift
//  Clima
//
//  Created by Brandon Man on 4/2/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

protocol CanRecieve {
    func dataRecieved(isFarenheightOrCelcius: String, sunsetSunrise : String, sunsetSunriseTimeIsOn:String)
}


class SettingsViewController: UIViewController {
    
    
    // Toggle Celcius to farenheight or vice versa
    let weatherData = WeatherDataModel()
    var farenheightCelciusState = "isCelcius"
    var delegate : CanRecieve?
    var temperature = ""
    var sunsetSunrise = ""
    var sunsetSunriseTime = ""
    
    @IBOutlet weak var farenheightOrCelcius: UISegmentedControl!
    
    
    
    
    
    @IBAction func farenheightCelciusToggle(_ sender: Any) {
        switch (farenheightOrCelcius.selectedSegmentIndex){
            
        case 0:
            print ("Celcius has been selected")
            farenheightCelciusState = "isCelcius"
            
        case 1:
            print ("Farenheight has been selected")
            farenheightCelciusState = "isFarenheight"
            
        default:
            print ("There is an error")
        }
    }
    
    
    
    
    
    
    // Toggle sunset/sunrise feature off
    
    @IBOutlet weak var sunriseSunset: UISegmentedControl!
    
    @IBAction func sunriseSunsetToggle(_ sender: Any) {
        switch(sunriseSunset.selectedSegmentIndex){
        case 0:
            sunsetSunrise = "featureOn"
            print ("Feature has been turned on")
        case 1:
            sunsetSunrise = "featureOff"
            print ("Feature has been turned off")
        default:
            print ("There is an error")
        }
    }
    
    //Toggle sunset/sunrise times off
    
    @IBOutlet weak var sunriseSunsetTime: UISegmentedControl!
    
    @IBAction func sunriseSunsetTimeToggle(_ sender: Any) {
    switch(sunriseSunsetTime.selectedSegmentIndex){
        case 0:
            print ("Sunset/Sunrise Time is on")
        sunsetSunriseTime = "isOn"
        
        case 1:
            print ("Sunset/Sunrise Time is off")
        sunsetSunriseTime = "isOff"
        default:
            print ("There is an error")
        }
    }
    
    
    
    
    
    
    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataRecieved(isFarenheightOrCelcius: farenheightCelciusState, sunsetSunrise: sunsetSunrise, sunsetSunriseTimeIsOn: sunsetSunriseTime )
        self.dismiss(animated: true, completion: nil)
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        //print (farenheightCelciusState)
        if farenheightCelciusState == "isCelcius"{
            farenheightOrCelcius.selectedSegmentIndex = 0
        }
        if farenheightCelciusState == "isFarenheight"{
            farenheightOrCelcius.selectedSegmentIndex = 1
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
