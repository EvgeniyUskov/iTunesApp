//
//  UIHelper.swift
//  ItunesApp
//
//  Created by Evgeniy Uskov on 14.01.2021.
//

import UIKit

enum Constants {
    
    enum Colors {
        static let backgroundColor = UIColor(named: "BgColor")
        static let textColor = UIColor(named: "TextColor")
        static let coverTextColor = UIColor(named: "CoverColor")
    }
    
    enum Ids {
        static let albumCellReuseId = "albumCell"
        static let collectionHeaderId = "collectionHeader"
        static let infoCellReuseId = "infoCell"
        static let trackCellReuseId = "trackCell"
        static let historyCellReuseId = "historyCell"
    }
    
    enum Urls {
        static let tracksUrl = "https://itunes.apple.com/search?term="
        static let tracksUrlSuffix = "&limit=25"
        static let albumsUrl = "https://itunes.apple.com/lookup?id="
        static let albumsUrlSuffix = "&entity=album"
    }
    
    enum Stuff {
        static let searchPlaceholderText = "Artist"
        static let headerText = "Albums"
        static let tracksHeaderText = "Tracks:"
        static let dragDownImage = UIImage(named: "Drag Down")
        
        static let noHistoryTitleMessage = "История пуста"
        static let noHistorySubtitleMessage = "Ваша лента пуста"
        
        static let noAlbumsTitleMessage = "Нет альбомов"
        static let noAlbumsSubtitleMessage = "Добавьте источники для получения новостей"
        
        static let rightBarButtonItemText = "Назад"
    }
}
