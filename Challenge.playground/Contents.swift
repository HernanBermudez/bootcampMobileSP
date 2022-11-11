import UIKit

var greeting = "Hello, playground"

struct RandomString {
    let tipoA = "tipoa";
    let tipoB = "tipob";
    var randomNumbersString = "";
    mutating func getRandomString(str: String){
        if str.lowercased() == tipoA {
            randomNumbersString.append("54")
            for _ in 1...8 {
                randomNumbersString.append(String(Int.random(in: 1..<10)))
            }
            print(randomNumbersString)
        }
        if str.lowercased() == tipoB {
            randomNumbersString.append("08")
            for _ in 1...8 {
                randomNumbersString.append(String(Int.random(in: 1..<10)))
            }
            print(randomNumbersString)
        }
    }
}
// Instance of the structure RandomString:
var randomString = RandomString()
randomString.getRandomString(str: "TipoB")
