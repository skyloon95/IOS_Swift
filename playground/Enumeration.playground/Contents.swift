import Cocoa

enum Direction {
    case north
    case south
    case west
    case east
}

//  변수 directionToHead 는 Direction 형 변수가 된다. 앞으로 가질 수 있는 값은 Direction의 멤버로 제한
var directionToHead = Direction.west

//  .east 를 대입한 것으로 directionToHead가 Direction형으로 이미 정의되었기 때문에 Direction.east를 전부 적어주지 않아도 된다.
directionToHead = .east

//  변수의 타입어노테이션을 미리 알려줬기 때문에 이런 방식으로도 가능함.
var direction: Direction = .north

//  열거형의 스위치 구문 활용
switch directionToHead {
case Direction.north:
    print("North")
case Direction.south:
    print("South")
case Direction.west:
    print("West")
case Direction.east:
    print("East")
}   //  비교대상에 뭐가 들어올지 확실히 정해져 있기 때문에 별도의 default 구문 필요 없음.

//  간략화 ( 변수를 통해 타입 추측이 가능하기 때문에 축약이 가능함 )
switch direction {
case .north:
    print("North")
case .south:
    print("South")
case .west:
    print("West")
case .east:
    print("East")
}

//  멤버와 값의 분리
enum HTTPCode: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
}

//  rawValue를 통해 값을 읽어낼 수 있음.
HTTPCode.OK.rawValue    //  200
HTTPCode.NOT_MODIFY.rawValue    //  304
HTTPCode.INCORRECT_PAGE.rawValue    //  404
HTTPCode.SERVER_ERROR.rawValue  //  500

//  값의 자동할당
enum Rank: Int {
    case one = 1
    case two, three, four, five
}

Rank.one.rawValue
Rank.two.rawValue
Rank.three.rawValue
Rank.four.rawValue
Rank.five.rawValue

//   연관값을 통한 사용시점의 멤버 보조값 추가.
enum ImageFormat {
    case JPEG
    case PNG(Bool)
    case GIF(Int, Bool)
}

var newImage = ImageFormat.PNG(true)
newImage = .GIF(256, false)

//  enum의 내부에 메소드 추가. enum의 멤버를 인스턴스로 활용
enum HTTPCode2: Int {
    case OK = 200
    case NOT_MODIFY = 304
    case INCORRECT_PAGE = 404
    case SERVER_ERROR = 500
    
    var value: String {
        return "HTTPCode number is \(self.rawValue)"
    }
    
    func getDescription() -> String {
        switch self {
        case .OK:
            return "응답이 성공했습니다. HTTP 코드는 \(self.value)입니다."
        case .NOT_MODIFY:
            return "응답이 성공했습니다. HTTP 코드는 \(self.value)입니다."
        case .INCORRECT_PAGE:
            return "응답이 성공했습니다. HTTP 코드는 \(self.value)입니다."
        case .SERVER_ERROR:
            return "응답이 성공했습니다. HTTP 코드는 \(self.value)입니다."
        }
    }

    static func getName() -> String {
        return "This Enumeration is HTTPCode"
    }
}

var response = HTTPCode2.OK
response = .NOT_MODIFY

response.value
response.getDescription()

HTTPCode2.getName()

