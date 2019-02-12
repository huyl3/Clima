//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
    func userFlippedSwitch(value: Bool)
}


class ChangeCityViewController: UIViewController {
    var delegate : ChangeCityDelegate?
   
    // the variable switchTrueFalse is what we send to the other view controller
    var switchTrueFalse: Bool = true
    //This code updates if the switch is on or off
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitch.isOn = switchTrueFalse
    }
    

// IBOutlet linked to the switch
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)
        delegate?.userFlippedSwitch(value: switchTrueFalse)

        self.dismiss(animated: true, completion: nil)
        
    }
    //function for switch that updates the variable switchTrueFalse
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
        switchTrueFalse = true
        }
        else
        {
        switchTrueFalse = false
            
            
        }
   }
    

    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        delegate?.userFlippedSwitch(value: switchTrueFalse)
        
    }
    
}
