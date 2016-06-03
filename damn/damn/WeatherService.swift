//
//  WeatherService.swift
//  damn
//
//  Created by 劉 家寯 on 5/30/16.
//  Copyright © 2016 劉 家寯. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setweather(weather:Weather)
}

class WeatherService{
    
    var delegate: WeatherServiceDelegate?
    
    func getweather(city: String){
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=5458adcd952eaff9a713e62f3cad5232"
        
        let url = NSURL(string: path)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) { (data:NSData?, responce: NSURLResponse?, error:NSError?) in
            print("\(data)")
        }
        
        task.resume()
        
        
        
        
        
        
//        print("---> \(city)")
//        
//        
//        let weather = Weather(Cityname: city, temp: 200.5 , Description: "Have a nice day!")
//        
//        if delegate != nil{
//        delegate?.setweather(weather)
//        }
//        
        
        
    }
}