import UIKit

class MyTableViewController: UITableViewController {
    
    // 데이터 클래스 객체 생성
    var foodStores:[FoodStore] = [
        FoodStore(name: "늘해랑", image: "01", address: "부산광역시 부산진구 양정1동 350-1", tel: "051-863-6997", menu: "수육백반, 돼지국밥, 순대국밥, 내장국밥", type: "돼지국밥집"),
        FoodStore(name: "번개반점", image: "02", address: "부산광역시 부산진구 양정동 418-282", tel: "051-852-9969", menu: "짜장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피", type: "중화요리"),
        FoodStore(name: "아딸", image: "03", address: "부산광역시 부산진구 양정동 393-18", tel: "051-852-9969", menu: "떡볶이, 오뎅, 떡강정, 핫도그, 튀김", type: "분식점"),
        FoodStore(name: "왕짜장", image: "04", address: "부산광역시 부산진구 양정1동 356-22", tel: "051-863-6997", menu: "짜장면, 짬뽕, 짬짜면, 탕수육, 볶짜면, 군만두, 양장피", type: "중화요리"),
        FoodStore(name: "토마토 도시락", image: "05", address: "부산광역시 부산진구 양정1동 산19-8", tel: "051-863-6997", menu: "치킨마요, 참치마요, 돈불와퍼, 돈치와퍼, 돈까스카레", type: "도시락"),
        FoodStore(name: "홍콩반점", image: "06", address: "부산광역시 부산진구 양정동 353-38", tel: "051-863-6997", menu: "짬뽕, 짜장면, 짬뽕밥, 볶음밥, 탕수육, 군만두", type: "중화요리"),
        FoodStore(name: "영남관", image: "07", address: "부산광역시 부산진구 양지동 418-61", tel: "051-865-0032", menu: "짬뽕, 짜장면, 짬뽕밥, 볶음밥, 탕수육, 군만두", type: "중화요리"),
        FoodStore(name: "명동불백", image: "08", address: "부산광역시 부산진구 양정동 418-214", tel: "051-867-8581", menu: "명동불백, 고추장불백, 김치덮밥, 양파돈까스덮밥, 양파탕수육덮밥", type: "한식"),
        FoodStore(name: "미쳐버린파닭", image: "09", address: "부산광역시 부산진구 양정동 350-61", tel: "051-851-2688", menu: "순살후라이드+양념치킨+콜라+쿠폰, 순살후라이드+간장치킨+콜라+쿠폰", type: "치킨집"),
        FoodStore(name: "개미식당", image: "10", address: "부산광역시 부산진구 연제구 연산동 2063-15", tel: "051-868-8020", menu: "참치찌개, 순두부, 된장찌개, 김치찌개, 시락국, 두루치기정식, 비빔밥", type: "한식"),
        FoodStore(name: "교촌치킨", image: "11", address: "부산광역시 부산진구 양정2동 310-6", tel: "051-853-5458", menu: "교촌라이스세트, 교촌콤보, 교촌오리지널, 교촌윙, 교촌허니콤보", type: "치킨집"),
        FoodStore(name: "피자스쿨", image: "12", address: "부산광역시 부산진구 양정동 360-32", tel: "051-853-3363", menu: "블갈비만두피자, 페페로니피자, 포테이토피자, 치즈피자, 콤비네이션피자", type: "피자집"),
        
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        self.title = "DIT 배달통"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return foodStores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
            as! FoodStoreTableViewCell
        // Configure the cell...
        
        
        cell.foodStoreCellName.text = foodStores[indexPath.row].name
        cell.foodStoreCellImage.image = UIImage(named: foodStores[indexPath.row].image)
        cell.foodStoreCellAddress.text = foodStores[indexPath.row].address
        cell.foodStoreCellTel.text = foodStores[indexPath.row].tel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        
        let optionMenu = UIAlertController(title : nil, message : "무엇을 원하시나요", preferredStyle : .actionSheet)
        
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                
                destinationController.name = foodStores[indexPath.row].name
                // 이미지 넘기기
                destinationController.cellImage = foodStores[indexPath.row].image
                destinationController.local1 = foodStores[indexPath.row].address
                destinationController.tel1 = foodStores[indexPath.row].tel
                destinationController.menu = foodStores[indexPath.row].menu
                destinationController.type = foodStores[indexPath.row].type
                
            }
        } else if segue.identifier == "totalMapView" {
                let destinationController = segue.destination as! TotalMapViewController
                    destinationController.totalFoodStores = foodStores
        }
    }
}
