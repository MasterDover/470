//
//  numRolls.swift
//  newDie
//
//  Created by admin on 10/7/15.
//  Copyright © 2015 admin. All rights reserved.
//

import WatchKit
import Foundation


class numRolls: WKInterfaceController {

    @IBOutlet var theTable: WKInterfaceTable!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let labelNames = ["1","2","3","4","5","6","7","8","9","10"]
        
        self.theTable.setNumberOfRows(labelNames.count, withRowType: "cell")
        
        for(var i = 0; i < labelNames.count; i++)
        {
            let currRow = self.theTable.rowControllerAtIndex(i) as! moreRows
            currRow.theLabel.setText(labelNames[i])
        }
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        theStuff.dieList.append("\(rowIndex + 1)\(theStuff.currDie)")
        self.popToRootController()
        
        
    }
}
