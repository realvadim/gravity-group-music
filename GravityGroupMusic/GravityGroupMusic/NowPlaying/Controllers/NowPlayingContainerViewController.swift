//
//  NowPlayingContainerViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/11/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class NowPlayingContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOW PLAYING"
        //add(OneSongViewController())
        //add(AlbumSongsListViewController()f)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(segue.identifier)
    }
}

