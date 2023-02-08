import Foundation

/// Question data base that containts all the questions in the project
struct QuestionDataBase {
    
    static let shared = QuestionDataBase()
    
    private let lowQuestions: [Question] = [
        Question(
            question: "Какая столица Португалии?",
            answers: Answer(
                aAnswer: [false : "Минск"], bAnswer: [false : "Рига"],
                cAnswer: [true : "Лиссабон"], dAnswer: [false : "Сыктыквар"])),
        Question(
            question: "Конец Первой мировой войны",
            answers: Answer(
                aAnswer: [true : "1918 г."], bAnswer: [false : "1917 г."],
                cAnswer: [false : "1945 г."], dAnswer: [false : "Такой не было"])),
        Question(
            question: "На каких ножках стояла избушка Бабы Яги?",
            answers: Answer(
                aAnswer: [false : "Свиных"], bAnswer: [false : "Металлических"],
                cAnswer: [false : "Фундаментных"], dAnswer: [true : "Куриных"])),
        Question(
            question: "Что получают выпускники после окончания обучения?",
            answers: Answer(
                aAnswer: [false : "Славу"], bAnswer: [false : "Деньги"],
                cAnswer: [true : "Диплом"], dAnswer: [false : "Фингал"])),
        Question(
            question: "Так называется самая большая планета Солнечной системы.",
            answers: Answer(
                aAnswer: [false : "Земля"], bAnswer: [true : "Юпитер"],
                cAnswer: [false : "Нептун"], dAnswer: [false : "Марс"])),
        Question(
            question: "С ним и будильник не нужен.",
            answers: Answer(
                aAnswer: [false : "С соседом"], bAnswer: [false : "С мужем"],
                cAnswer: [true : "С петухом"], dAnswer: [false : "С сокамерником"])),
        Question(
            question: "Как называется самая высокая трава?",
            answers: Answer(
                aAnswer: [true : "Бамбук"], bAnswer: [false : "Папоротник"],
                cAnswer: [false : "Борщевик"], dAnswer: [false : "Камыш"])),
        Question(
            question: "Куда заносят животных, которых исчезают?",
            answers: Answer(
                aAnswer: [false : "В блокнот"], bAnswer: [false : "В зоопарк"],
                cAnswer: [false : "В музей"], dAnswer: [true : "В Красную книгу"])),
        Question(
            question: "Гараж - для машин. А как называется помещение для самолетов?",
            answers: Answer(
                aAnswer: [false : "Сарай"], bAnswer: [false : "Парковка"],
                cAnswer: [true : "Ангар"], dAnswer: [false : "Оставляют на улице"])),
        Question(
            question: "В какой стране находится самое высокое здание?",
            answers: Answer(
                aAnswer: [false : "В Южном Судане"], bAnswer: [true : "В Дубае"],
                cAnswer: [false : "В Китае"], dAnswer: [false : "В США"])),
    ]
    
    private let mediumQuestions: [Question] = [
        Question(
            question: "Сколько вдохов делает человеческое тело ежедневно?",
            answers: Answer(
                aAnswer: [false : "Ни одного"], bAnswer: [true : "20.000"],
                cAnswer: [false : "320.000"], dAnswer: [false : "1.800"])),
        Question(
            question: "В каком году Юрий Гагарин совершил свой полёт?",
            answers: Answer(
                aAnswer: [true : "1961"], bAnswer: [false : "1988"],
                cAnswer: [false : "1986"], dAnswer: [false : "1972"])),
        Question(
            question: "Как называется спутник Земли?",
            answers: Answer(
                aAnswer: [false : "COVID19"], bAnswer: [false : "Солнце"],
                cAnswer: [false : "Звезда"], dAnswer: [true : "Луна"])),
        Question(
            question: "В какое время года Земля бывает ближе к Солнцу?",
            answers: Answer(
                aAnswer: [false : "Осенью"], bAnswer: [false : "Летом"],
                cAnswer: [true : "Зимой"], dAnswer: [false : "Весной"])),
        Question(
            question: "С помощью какой звезды находят стороны света?",
            answers: Answer(
                aAnswer: [true : "Полярная"], bAnswer: [false : "Большая медведица"],
                cAnswer: [false : "Сириус"], dAnswer: [false : "Вега"])),
        Question(
            question: "Как часто проводятся летние Олимпийские игры?",
            answers: Answer(
                aAnswer: [false : "1 раз в 2 года"], bAnswer: [false : "2 раза в год"],
                cAnswer: [true : "1 раз в 4 года"], dAnswer: [false : "Каждую неделю"])),
        Question(
            question: "Какая пустыня покрывает большую часть Северной Африки?",
            answers: Answer(
                aAnswer: [true : "Сахара"], bAnswer: [false : "Калахари"],
                cAnswer: [false : "Чиуауа"], dAnswer: [false : "Карру"])),
        Question(
            question: "Какой треугольник имеет три неравные стороны",
            answers: Answer(
                aAnswer: [false : "Равносторонний"], bAnswer: [false : "Кривой"],
                cAnswer: [false : "Любой"], dAnswer: [true : "Неавносторонний"])),
        Question(
            question: "Какой фрукт содержит калий и помогает понижать кровяное давление?",
            answers: Answer(
                aAnswer: [false : "Кокос"], bAnswer: [false : "Яблоко"],
                cAnswer: [true : "Банан"], dAnswer: [false : "Свекла"])),
    ]
    
    private let hardQuestions: [Question] = [
        Question(
            question: "Кто был премьер-министр Великобритании с 1841 по 1846 год?",
            answers: Answer(
                aAnswer: [true : "Роберт Пил"], bAnswer: [false : "Уинстон Черчилль"],
                cAnswer: [false : "Принц Чарльз"], dAnswer: [false : "Джун Лоу"])),
        Question(
            question: "Какой химический символ для серебра?",
            answers: Answer(
                aAnswer: [false : "Ds"], bAnswer: [false : "Si"],
                cAnswer: [false : "S"], dAnswer: [true : "Ag"])),
        Question(
            question: "Какая самая маленькая птица в мире?",
            answers: Answer(
                aAnswer: [false : "Бормотушка"], bAnswer: [true : "Пчела колибри"],
                cAnswer: [false : "Бабочка"], dAnswer: [false : "Синица-ремез"])),
        Question(
            question: "Что на визитной карточке Аль Капоне было указано, чем он занимается?",
            answers: Answer(
                aAnswer: [false : "Дегустатор спиртных напитков"], bAnswer: [false : "Консультант"],
                cAnswer: [true : "Продавец подержанной мебели"], dAnswer: [false : "Сварочник 4 разряда"])),
        Question(
            question: "В каком городе расположен Букингемский дворец?",
            answers: Answer(
                aAnswer: [false : "В Букингеме"], bAnswer: [true : "В Лондоне"],
                cAnswer: [false : "В Дрездене"], dAnswer: [false : "В Бишкеке"])),
        Question(
            question: "Какая страна послала армаду, чтобы атаковать Англию в 1588 году?",
            answers: Answer(
                aAnswer: [false : "Япония"], bAnswer: [false : "Россия"],
                cAnswer: [true : "Испания"], dAnswer: [false : "Германия"])),
        Question(
            question: "Какой город расположен как в Азии, так и в Европе?",
            answers: Answer(
                aAnswer: [true : "Стамбул"], bAnswer: [false : "Вена"],
                cAnswer: [false : "Будапешт"], dAnswer: [false : "Санкт-Петербург"])),
        Question(
            question: "Что является третьим наиболее распространенным газом в атмосфере Земли?",
            answers: Answer(
                aAnswer: [false : "Азот"], bAnswer: [false : "Углекислый"],
                cAnswer: [false : "Кислород"], dAnswer: [true : "Аргон"])),
        Question(
            question: "Какое название самого высокого в мире водопада?",
            answers: Answer(
                aAnswer: [false : "Виктория"], bAnswer: [false : "Вернал"],
                cAnswer: [true : "Анхель"], dAnswer: [false : "Ниагарский"])),
    ]
    
    func fetchRandomLowQuestions() -> [Question] {
        lowQuestions.shuffled()
    }
    
    func fetchRandomMediumQuestions() -> [Question] {
        mediumQuestions.shuffled()
    }
    
    func fetchRandomHardQuestions() -> [Question] {
        hardQuestions.shuffled()
    }
}
