//
//  File.swift
//  GallaryAppScreen
//
//  Created by Ваня Сокол on 15.11.2022.
//

import Foundation

struct CellGroup: Hashable {
    let type: typeOfCell
    let cellsInGroup: [AnyCell]
    let headersInGroup: [AnyHeader]
}

enum typeOfCell {
    case firstRow
    case secondRow
    case list
}

struct AnyCell: Hashable {
    let name: String
    let counterPhotos: Int
    let image: String
}

struct AnyHeader: Hashable {
    let header: String
    let titleButton: String?
}

class ModelData {

    static func getCells() -> [CellGroup] {
        return [
            CellGroup(type: .firstRow,
                      cellsInGroup: [
                        AnyCell(name: "Недавние", counterPhotos: 100, image: "nedevnie"),
                        AnyCell(name: "Избранное", counterPhotos: 220, image: "izbrannoe"),
                        AnyCell(name: "Instagram", counterPhotos: 500, image: "instagram"),
                        AnyCell(name: "WhatsApp", counterPhotos: 1700, image: "whatsapp"),
                        AnyCell(name: "SnapChat", counterPhotos: 10, image: "snapchat"),
                        AnyCell(name: "TikTok", counterPhotos: 20, image: "tiktok"),
                        AnyCell(name: "VSCO", counterPhotos: 50, image: "vsco")
                      ],
                      headersInGroup: [
                        AnyHeader(header: "Мои альбомы", titleButton: "См. все")
                      ]
                     ),
            CellGroup(type: .secondRow,
                      cellsInGroup: [
            AnyCell(name: "Люди", counterPhotos: 888, image: "ludi"),
            AnyCell(name: "Места", counterPhotos: 999, image: "mesta")
                      ],
                      headersInGroup: [AnyHeader(header: "Люди и места", titleButton: "См. все")]
                     ),
            CellGroup(type: .list,
                      cellsInGroup: [
            AnyCell(name: "Видео", counterPhotos: 186, image: "video"),
            AnyCell(name: "Селфи", counterPhotos: 229, image: "person.crop.square"),
            AnyCell(name: "Видео", counterPhotos: 185, image: "livephoto"),
            AnyCell(name: "Фото Live Photos", counterPhotos: 100, image: "cube"),
            AnyCell(name: "Портреты", counterPhotos: 62, image: "timelapse"),
            AnyCell(name: "Таймлапс", counterPhotos: 3, image: "slowmo"),
            AnyCell(name: "Замедленно", counterPhotos: 4, image: "video"),
            AnyCell(name: "Снимки экрана", counterPhotos: 120, image: "camera.viewfinder"),
            AnyCell(name: "Записи экрана", counterPhotos: 3, image: "record.circle"),
            AnyCell(name: "Анимированные", counterPhotos: 1, image: "square.stack.3d.forward.dottedline"),
                      ],
                      headersInGroup: [AnyHeader(header: "Типы медиафайлов", titleButton: nil)]
                     ),
            CellGroup(type: .list,
                      cellsInGroup: [
            AnyCell(name: "Импортированные", counterPhotos: 200, image: "square.and.arrow.down"),
            AnyCell(name: "Скрытые", counterPhotos: 0, image: "eye.slash"),
            AnyCell(name: "Недавно удаленные", counterPhotos: 20, image: "trash")
                      ],
                      headersInGroup: [AnyHeader(header: "Другое", titleButton: nil)]
                     ),
        ]
    }
}
