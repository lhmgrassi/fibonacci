//
//  FibonacciViewController
//  Fibonacci
//
//  Created by Luis Henrique Grassi on 11/07/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

let max_int32 = 2147483647

class FibonacciViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
        
    var fibonacci : FibonacciHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if fibonacci == nil {
            fibonacci = FibonacciHelper()
        }
        
        if #available(iOS 10.0, *) {
            tableView.prefetchDataSource = self
        }
        
        //I am not sure about this TODO
        //3. Automatically calculate all Fibonacci numbers f(n) that are lower than MAX_LONG
        if Int.max <= max_int32 {
            print("32bits")
            let _ = fibonacci.fibonacci(46)
        } else {
            print("64bits")
            let _ = fibonacci.fibonacci(92)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        //release memory
        fibonacci.cache.removeAll()
    }

}

extension FibonacciViewController : UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FibonacciTableViewCell", for: indexPath)
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.5
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        cell.accessoryView = indicator
        indicator.startAnimating()
        
        //TODO: - a good improvement would be cancel threds that are calculating for cells not visible anymore
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

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach({ indexPath in
            let _ = fibonacci.fibonacci(indexPath.row)
        })
    }
    
    
}

