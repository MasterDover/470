//
//  page2.swift
//  newDie
//
//  Created by admin on 10/7/15.
//  Copyright © 2015 admin. All rights reserved.
//

import WatchKit
import Foundation


class page2: WKInterfaceController {

    @IBOutlet var theTable: WKInterfaceTable!
    let labelNames = ["D4","D6","D8","D10","D12","D20","D100"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
        
        self.theTable.setNumberOfRows(labelNames.count, withRowType: "cell")
        
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! diceRow
            currRow.theLabel.setText(labelNames[i])
            currRow.theImage.setImageNamed("d\(i).jpeg")
        }
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        theStuff.currDie = labelNames[rowIndex]
        self.pushControllerWithName("numRolls", context: "what")
        
        
    }

}
