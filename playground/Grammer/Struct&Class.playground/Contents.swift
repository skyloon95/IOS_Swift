import Cocoa

struct Resolution{
    var width = 0
    var height = 0
}

var fhd = Resolution(width: 1920, height: 1080)
var cinema = fhd
cinema.width = 2560

print(fhd)
print(cinema)
//  cinema에 들어간 Resolution 구조체의 인스턴스는 fhd에 할당되었던 것이 복사된 것 뿐이기 때문에 fhd값은 바뀌지 않고 그대로다

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let video = VideoMode()
video.name = "Original Video Interance"

print("video 의 name : \(video.name!)")

let dvd = video
dvd.name = "DVD video Instance"

print("video 의 name : \(video.name!)")
//  참조 방식의 값 전달이기 때문에 원본인 video의 프로퍼티가 변경된 것을 확인할 수 있다.

func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}

changeName(v: video)
print("video 의 name : \(video.name!)")
//  parameter로 전달 된 것 역시 video가 참조하고 있는 인스턴스의 메모리값이기 때문에 값이 직접 변경
