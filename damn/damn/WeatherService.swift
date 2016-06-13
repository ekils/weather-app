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
    func weatherErrorWithMessage(message: String)
}

class WeatherService{
    
    var delegate: WeatherServiceDelegate?
    
    func getweather(city: String){
        
        
        let cityEscape = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        let appid  = "5458adcd952eaff9a713e62f3cad5232"
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscape!),uk&appid=\(appid)"
        
        let url = NSURL(string: path)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) {
            (data:NSData?, response: NSURLResponse?, error:NSError?) in
            //print("\(data)")
            
            if let httpResponse = response as? NSHTTPURLResponse{
                
                print("*******")
                print(  httpResponse.statusCode  )
                print("*******")
                
            }
            
            
            
            let json = JSON(data: data!)
            
            print(json)
            
            var status = 0
            if let cod = json["cod"].int{
                status = cod
            }
            else if let cod = json["cod"].string{
                status = Int(cod)!
            }
            print("weathe status code:\(status)")
            
            
            
            if status == 200{
                //ok
                let lon = json["coord"]["lon"].double
                let lat = json["coord"]["lat"].double
                let temp = json["main"]["temp"].double
                let name = json["name"].string
                let desc = json["weather"][0]["description"].string
                let icon = json["weather"][0]["icon"].string
                let clouds = json["clouds"]["all"].double
            
                 let weather  = Weather(Cityname: name!,
                                   temp: temp!,
                                   Description: desc!, 
                                   icon: icon!,
                                   clouds: clouds!)
                
                if self.delegate != nil{
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                self.delegate?.setweather(weather)
                })
                 print("lon:\(lon!) , lat:\(lat!), temp:\(temp!)")
                    
            }
            else if status == 404{
                //not found
                    
                    if self.delegate != nil{
                        
                    dispatch_async(dispatch_get_main_queue(), {
                            
                    self.delegate?.weatherErrorWithMessage("City not found")
                    })
                        
                    }

            }
            else{
                    if self.delegate != nil{
                        
                    dispatch_async(dispatch_get_main_queue(), {
                            
                    self.delegate?.weatherErrorWithMessage("Something wrong?")
                    })
                        
                    }
            }
            
            
            
            
            
            
            
                
                
                
            }
            
           
            
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