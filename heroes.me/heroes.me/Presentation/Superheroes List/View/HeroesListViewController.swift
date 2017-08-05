//
//  HeroesListViewController.swift
//  heroes.me
//
//  Created by Pedro Cabrera on 24/7/17.
//  Copyright © 2017 Pedro Cabrera Rodriguez. All rights reserved.
//

import UIKit
import SDWebImage

class HeroesListViewController: UIViewController {
    
    private let presenter: HeroesListPresenter
    fileprivate var heroes: [Hero]?
    fileprivate let cellID = "HERO_CELL_ID"
    
    @IBOutlet weak fileprivate var spinner: UIActivityIndicatorView!
    @IBOutlet weak fileprivate var tableView: UITableView!
    @IBOutlet weak fileprivate var errorMsg: UILabel!
    
    
    init(presenter: HeroesListPresenter) {
        self.presenter = presenter
        super.init(nibName: "HeroesListViewController", bundle: .main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hero.me"
        
        let nib = UINib(nibName: "HeroCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: cellID)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100

        self.tableView.isHidden = true
        self.errorMsg.isHidden = true
        self.errorMsg.text = "An error ocurred"

        self.presenter.viewDidLoad()
    }

}

extension HeroesListViewController: HeroesListView {
    
    func startLoadingState() {
        self.spinner.startAnimating()
    }
    
    func stopLoadingState() {
        self.spinner.stopAnimating()
    }
    
    func showErrorState() {
        self.errorMsg.isHidden = false
        self.tableView.isHidden = true
    }
    
    func showHeroesSection(with values: [Hero]) {
        self.heroes = values
        self.tableView.isHidden = false
        self.errorMsg.isHidden = true
        self.tableView.reloadData()
    }

}

extension HeroesListViewController: UITableViewDelegate {
    
}

extension HeroesListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.heroes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HeroCellTableViewCell
        let hero = heroes![indexPath.row]
        
        cell.photo.sd_setImage(with: hero.urlToPhoto, placeholderImage: nil)
        
        cell.name.text = hero.name
        cell.name.font = .bigBold
        
        cell.realName.text = hero.realName
        cell.realName.font = .small
        cell.realName.textColor = .secondaryText
        
        cell.heroDescription.text = hero.description
        cell.heroDescription.font = .regular
        
        cell.power.text = hero.power
        cell.heroDescription.font = .regular
        
        return cell
    }
    
}
