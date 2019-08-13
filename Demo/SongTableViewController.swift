//
//  MovieTableViewController.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/7/19.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    var songs = [Song(name: "體面", singer: "于文文", lyrics: """
分手應該體面 誰都不要說抱歉
何來虧欠 我敢給就敢心碎
鏡頭前面是從前的我們 在喝彩
流著淚聲嘶力竭
離開也很體面 才沒辜負這些年
愛得熱烈 認真付出的畫面
別讓執念 毀掉了昨天
我愛過你 俐落乾脆
"""),
                 Song(name: "後來", singer: "劉若英", lyrics: """
後來　我總算學會了如何去愛　可惜你早已遠去　消失在人海
後來　終於在眼淚中明白　有些人　一旦錯過就不在
"""),
                 Song(name: "帥到分手", singer: "周湯豪", lyrics: """
我帥到分手 安全感不夠
你選擇向錢走 現實將我爆頭
我帥到分手 安全感不夠
你選擇向錢走 原來你是高手 話都你在說
""")]
    var dataSource: UITableViewDiffableDataSource<Section , Song>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = UITableViewDiffableDataSource<Section , Song>(tableView: tableView, cellProvider: { (tableView, indexPath, movie) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
            cell.imageView?.image = UIImage(named: movie.name)
            cell.textLabel?.text = movie.singer
            return cell
        })
        tableView.dataSource = dataSource
        
        let snapShot = NSDiffableDataSourceSnapshot<Section, Song>()
        snapShot.appendSections([.song])
        snapShot.appendItems(songs)
        dataSource.apply(snapShot, animatingDifferences: false)
    }

    @IBSegueAction func showDetail(_ coder: NSCoder) -> SongDetailViewController? {

       if let row = tableView.indexPathForSelectedRow?.row {
           let song = songs[row]
           return SongDetailViewController(coder: coder, song: song)
        } else {
           return nil
        }
    }
    
}
