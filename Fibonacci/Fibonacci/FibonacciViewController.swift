//
//  FibonacciViewController
//  Fibonacci
//
//  Created by Luis Henrique Grassi on 11/07/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

class FibonacciViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
        
    var fibonacci : FibonacciHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fibonacci == nil {
            fibonacci = FibonacciHelper()
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        //release memory
        fibonacci.cache.removeAll()
    }

}

extension FibonacciViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FibonacciTableViewCell", for: indexPath) as! FibonacciTableViewCell
        
        cell.fibonacciLabel.text = "f(\(indexPath.row)) = \(fibonacci.fibonacci(indexPath.row))"
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 92
    }

    
    
    
}

