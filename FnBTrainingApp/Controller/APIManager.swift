//
//  APIManager.swift
//  FnBTrainingApp
//
//  Created by Daniel Claude Nabasa on 25/05/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//


import SwiftyJSON

class APIManager {
    let baseurl = "http://157.230.252.80:5050/api/v1" // web gw
    static let sharedInstance = APIManager() //api managernya
    static let getPostsEndpoint = "/recipes" //endpoint belakang tiap orang beda

    //contoh function
    func getRecipeWithId(recipeId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseurl + APIManager.getPostsEndpoint + String(recipeId)
        let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            }else {
                do {
                let result = try JSON(data: data!)
                    onSuccess(result)
                } catch {
                    //error
                }
                
                
            }
        })
        task.resume()
    }
    func getRecipe(onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
           let url : String = baseurl + APIManager.getPostsEndpoint
           let request : NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
           request.httpMethod = "GET"
           let session = URLSession.shared
           
           let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
               if(error != nil){
                   onFailure(error!)
               }else {
                   do {
                   let result = try JSON(data: data!)
                       print(result)
                       onSuccess(result)
                   } catch {
                       //error
                   }
                   
                   
               }
           })
           task.resume()
       }
}
