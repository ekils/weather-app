//
//  Weather.swift
//  damn
//
//  Created by 劉 家寯 on 5/31/16.
//  Copyright © 2016 劉 家寯. All rights reserved.
//

import Foundation

struct Weather {
    
    let Cityname:String
    let temp: Double
    let Description: String
    let icon:String
    let clouds: Double
    
    init(Cityname:String,
         temp:Double,
         Description: String,
         icon: String,
         clouds: Double){
        
        self.Cityname = Cityname
        self.temp = temp
        self.Description = Description
        self.icon = icon
        self.clouds = clouds
    }
    
}