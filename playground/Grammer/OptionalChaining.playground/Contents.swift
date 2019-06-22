import Cocoa

struct Human {
    var name: String?
    var man: Bool = true
}

struct Company {
    var ceo: Human?
    var companyName: String?
    func getCEO() -> Human? {
        return self.ceo
    }
}

var someCompany: Company? = Company(ceo: Human(name: "Steve Jobs", man: true), companyName: "Apple")

//  메소드의 옵셔널 체이닝
let name = someCompany?.getCEO()?.name
if name != nil {
    print("CEO name is : \(name!)")
}
