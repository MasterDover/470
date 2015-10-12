//
//  InterfaceController.swift
//  newDie WatchKit Extension
//
//  Created by admin on 10/7/15.
//  Copyright © 2015 admin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var theTable: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let currCount = theStuff.prefs.valueForKey("count")
        var check = currCount as! Int
        if(check != 0)
        {
           theStuff.dieList = theStuff.prefs.valueForKey("dieList")! as! [String]
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
       
        let labelNames = theStuff.dieList
        self.theTable.setNumberOfRows(labelNames.count, withRowType: "cell")
        
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! finalRow
            currRow.theLabel.setText(labelNames[i])
        }
        
        

        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        var ar = theStuff.dieList[rowIndex].componentsSeparatedByString("D")
        var message = ""
        let alert = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
        })
        
        for(var i = 0; i < Int(ar[0]); i++)
        {
          message += "\(rand() % Int32(ar[1])!), "
        }
        
        self.presentAlertControllerWithTitle("The Roll", message: "\(message)", preferredStyle: WKAlertControllerStyle.Alert, actions: [alert])
    }
    
    
    
}
