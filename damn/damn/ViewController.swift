//
//  ViewController.swift
//  damn
//
//  Created by 劉 家寯 on 5/27/16.
//  Copyright © 2016 劉 家寯. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    
    let weatherservice = WeatherService()
    
    
    
    @IBOutlet weak var templabel: UILabel!
    @IBOutlet weak var deslabel: UILabel!
    @IBOutlet weak var citylable: UILabel!
    
    
    
    @IBAction func tapplable(sender: UIButton) {
        print("tapped")
        opencityalert()
    }
    
    
    
    func opencityalert(){
        let alert = UIAlertController(title: "city" ,message: "enter city" , preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancle = UIAlertAction(title: "cancle", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alert.addAction(cancle)
        
        let ok = UIAlertAction(title: "ok",
                               style: UIAlertActionStyle.Default) { (action:UIAlertAction) in
                                print("done")
        let textfield = alert.textFields?[0]
                                print(textfield?.text!)
        self.citylable.text = textfield?.text!
        
        let cityname = textfield?.text!

        self.weatherservice.getweather(cityname!)
                                
        }
        
        alert.addAction(ok)
        
        alert.addTextFieldWithConfigurationHandler { (text: UITextField) in
            text.placeholder = "city name"
        }
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
    
    
    func setweather(weather:Weather) {
        print("what the fuck?")
        print("\(weather.Cityname) \(weather.temp)  \(weather.Description) ")
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.weatherservice.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

