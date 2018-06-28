//
//  add.swift
//  UiTableViewController Test 02
//
//  Created by King on 2018. 6. 29..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class add: NSObject {

    //공유기능
    @IBAction func toShare(_ sender: Any) {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(indexPath.row)
            
            
            let optionMenu = UIAlertController(title : nil, message : "무엇을 하시겠어요?", preferredStyle : .actionSheet)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            let callAction = UIAlertAction(title: "전화걸기", style: .default) {
                (action: UIAlertAction) -> Void in
                print("전화 걸기 실행!!")
                let alertMessage = UIAlertController(title: "현재 서비스 구축중", message: "죄송합니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertMessage.addAction(okAction)
                self.present(alertMessage, animated: true)
                
            }
            
            
            //체크박스 만들기
            let checkinAction = UIAlertAction(title: "체크 인", style: .default) {
                (action: UIAlertAction) -> Void in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
            }
            
            optionMenu.addAction(cancelAction)
            optionMenu.addAction(callAction)
            optionMenu.addAction(checkinAction)
            
            present(optionMenu, animated: true)
        }
        
        
    }
}
