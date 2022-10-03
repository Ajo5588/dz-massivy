import Foundation

//var dictionary = [String : String] ()
//var height = ["Ajo":1.83, "Nurai":1.60, "Anel":0.9]
//
//print(height.count)
//print(height.keys)

//№1. Через readLine вводится любое количество слов
//После чего эти слова сортируются по количеству символов
//Далее отображается самое короткое слово(если несколько с таким количеством - отобразить все) и так же самое длинное

let words = readLine()!

var wordlist = words.components(separatedBy:" ")


wordlist = wordlist.sorted{ $0.count > $1.count }

print(wordlist)

var lengthsOfWords: [Int] = [Int]()
for i in wordlist{
    lengthsOfWords.append(i.count)
}

print(lengthsOfWords)

for i in wordlist{
    if i.count == lengthsOfWords.max()!{
        print(i)
    }

    if i.count == lengthsOfWords.min()!{
        print(i)
        break
    }
}


//№3. Составить мини-игру “Викторина” используя массивы для записи вопросов и ответов
//В игре должно быть 5 раундов по 3 вопроса
//Так же должны быть несгораемые суммы
//Так же в конце если человек проиграл - показать какой ответ был верным и отобразить выигрыш и сколько раундов было выиграно

let questions: [String] = ["Самое большое сухопутное животное? а)Слон б)Медведь в)Жираф", "За какую страну играет Криштиану Роналду? а)Англия б)Испания в)Португалия", "Столица Чехии? а)Москва б)Бишкек в) Прага", "Кто проживает на дне океана? а)Спанч Боб б)Монстры в)Немо", "Самая маленькая птица? а)Ворона б)Орел в)Колибри", "Самок крепкое кофе? а)Американо б)Эспрессо в)Капучино", "Сколько длится минута? а)60сек б)55сек в)58сек", "Самый большой материк? а)Африка б)Южная Америка в)Евразия","Что является национальным животным Шотландии? а)Лошадь б)Единорог в)Волк", "Самый высокий пик в КР? а)Ленин б) Победы в)Гималай", "Сколько см в метр? а)10 б)50 в)100", "Какое имя у известного бойца Макгрегора? а)Конор б)Хабиб в)Тони" ]


var summaBank = 0
var round = 1
let answers: [String] = ["а", "в", "в", "а", "в", "б", "а", "в", "б", "б", "в", "а"]
var userAnswers: [String] = [String]()

print("Добро пожаловать в викторину!")
for i in 0..<questions.count {
    print("Раунд \(round). Вопрос: \(questions[i])")
    
    let answer = readLine()!
    if answer == answers[i] {
        summaBank += 500
        userAnswers.append(answer)
        print("Верно! Следующий вопрос! Ваш банк составил \(summaBank)")
        if summaBank % 3 == 0{
            round += 1
            print("Вы прошли на следующий раунд! Текущий раунд: \(round). Ваш банк на данный момент составляет: \(summaBank).")
        }
    } else{
        print("Вы проиграли! Верный вариант ответа \(answers[i]). Ваш банк составил: \"\(summaBank)\". Количество выигранных раундов: \(round-1).")
        break
    }
    
    if userAnswers == answers{
        print("секунду...")
        print("Вы выиграли все раунды! Поздравляем, вы победитель!. Ваш банк составил \(summaBank).")
    }
}

var totalArray:[[String]] = [[]]

func addToArraay(name:String) {
    let first = name.first!
    var found = false
    for (index,item) in totalArray.enumerated(){
        for (index2,item2) in item.enumerated(){
            if index2 == 0 && item2 == String(first) && found == false {
                totalArray[index].append(name)
                found = true
            }else{
                continue
            }
        }
    }
    if found == false {
        var array:[String] = []
        array.append((first))
        array.append(name)
        totalArray.append(array)
    }
    
}

let readline = readLine()!
addToArraay(name: readline)
let readline2 = readLine()!
addToArraay(name: readline2)
let readline3 = readLine()!
addToArraay(name: readline3)

print(totalArray)
for (index,item) in totalArray.enumerated() {
    if index != 0{
        print("\(item[0]) - \(totalArray[index].count - 1) контактов")
    }
        
}


