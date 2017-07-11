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
        
        print(Int.max)
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FibonacciTableViewCell", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.5
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        cell.accessoryView = indicator
        indicator.startAnimating()
        
        DispatchQueue.global(qos: .background).async { [unowned self] in
            let result = self.fibonacci.fibonacci(indexPath.row)
            DispatchQueue.main.async {
                indicator.stopAnimating()
                cell.textLabel?.text = "f(\(indexPath.row)) = \(result)"
            }
        }
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //max index to avoid overflow (tested in iphone 4s and iphone 6)
        return 1477
    }

    
    
    
}

