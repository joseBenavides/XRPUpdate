//
//  FirstViewController.swift
//  XRPUpdate
//
//  Created by Jose on 6/9/18.
//  Copyright © 2018 Jose Benavides. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PriceViewController: UIViewController {

    let coinURL = "https://www.bitstamp.net/api/v2/ticker/xrpusd/"
    let coinDataModel = CoinDataModel()
    
    @IBOutlet weak var accountValue: UILabel!
    @IBOutlet weak var AccountGainLoss: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCoinPrice(url: coinURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - ============GET COIN PRICE===============
    //================================================
    func getCoinPrice(url: String){
        
        //alamofire is how we do AJAX calls
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                if let json = response.result.value {
                    let coinJSON : JSON = JSON(response.result.value!)
                    //print(coinJSON)
                    self.updateCoinData(json: coinJSON)
                }
            }
            else{
                print("Error \(String(describing: response.result.error))")
                self.AccountGainLoss.text = "Can't connect to the interwebs"
            }
        }
    }
    
    //========================================
    func updateCoinData(json : JSON){
        
        if let currPrice = json["bid"].string
        {
            coinDataModel.currentPrice = json["bid"].doubleValue
            updateUIWithData()
        }
        else{
            AccountGainLoss.text = "Could not get the coin data"
        }
    }
    
    //=======================================
    func updateUIWithData(){
        round(12.334)
        coinPrice.text = "XRP $\(coinDataModel.currentPrice)"
        
        let currValue = coinDataModel.currentPrice * coinDataModel.holdings
        accountValue.text = "$\(round(100*currValue)/100)"
        
        var percentDiff = ((currValue / coinDataModel.origPrice)*100)
        percentDiff = 100 - (round(100*percentDiff)/100)
        //print (percentDiff)
        
        if(currValue >= coinDataModel.origPrice)
        {
            AccountGainLoss.text = "\(percentDiff)%"
        }
        else{
            AccountGainLoss.text = "-\(percentDiff)%"
        }
        
    }


}

