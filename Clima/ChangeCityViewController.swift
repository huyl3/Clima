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
    var switchTrueFalse = true // this is a default value so I don't have to use optionals
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleSwitch.isOn = switchTrueFalse
    }
    


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
