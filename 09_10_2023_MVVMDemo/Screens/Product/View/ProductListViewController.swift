//
//  ProductListViewController.swift
//  09_10_2023_MVVMDemo
//
//  Created by Vishal Jagtap on 04/02/24.
//

import UIKit

class ProductListViewController: UIViewController {
    private var viewModel = ProductViewModel()
    @IBOutlet weak var productTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        configuration()
    }
}

extension ProductListViewController{
    func configuration(){
        registerXIBTableView()
        initViewModel()
        observeEvent()
    }
    
    func registerXIBTableView(){
        let uiNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self] event
            in
            guard let self else {
                return
            }
            
            switch event{
            case .loading :
                print("Products loading")
            case .stopLoading:
                print("stop loading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}


extension ProductListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        productTableViewCell.product = viewModel.products[indexPath.row]
        return productTableViewCell
    }
}

extension ProductListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
}
