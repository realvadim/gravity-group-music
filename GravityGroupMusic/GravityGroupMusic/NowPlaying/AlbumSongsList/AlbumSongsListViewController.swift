//
//  AlbumSongsListViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/17/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class AlbumSongsListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private var songsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        // Do any additional setup after loading the view.
    }
    
    private func registerNib() {
        
        let cellNib = UINib(nibName: String(describing: SongTableViewCell.self), bundle: nil)
        
        songsListTableView.register(cellNib, forCellReuseIdentifier: String(describing: SongTableViewCell.self))
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsListTableView.dequeueReusableCell(withIdentifier: String(describing: SongTableViewCell.self), for: indexPath)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

