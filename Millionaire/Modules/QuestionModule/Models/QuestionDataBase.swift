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
        Question(
            question: "Что вы получаете, когда вы кипятите воду?",
            answers: Answer(
                aAnswer: [false : "Кисель"], bAnswer: [false : "Пиво"],
                cAnswer: [false : "Сок"], dAnswer: [true : "Пар"])),
        Question(
            question: "В сиквеле какого праздничного фильма снялся Дональд Трамп?",
            answers: Answer(
                aAnswer: [false : "Один дома"], bAnswer: [true : "Один дома 2: Затерянный в Нью-Йорке"],
                cAnswer: [false : "Ричи Рич"], dAnswer: [false : "Маленькие негодяи"])),
        Question(
            question: "Как называются четыре Факультета Хогвартса?",
            answers: Answer(
                aAnswer: [true : "Гриффиндор, Пуффендуй, Когтевран и Слизерин"], bAnswer: [false : "Грифон, Ворон, Слон и Змея"],
                cAnswer: [false : "Север, Восток, Запад и Юг"], dAnswer: [false : "Красный, Синий, Зеленый и Оранжевый"])),
        Question(
            question: "Из чего сделан самый крепкий дом в “Трех поросятах”?",
            answers: Answer(
                aAnswer: [true : "Кирпич"], bAnswer: [false : "Палочки"],
                cAnswer: [false : "Солома"], dAnswer: [false : "Бамбук"])),
        Question(
            question: "В какой стране находится Прага?",
            answers: Answer(
                aAnswer: [false : "Испания"], bAnswer: [false : "Бразилия"],
                cAnswer: [true : "Чехия"], dAnswer: [false : "Англия"])),
        Question(
            question: "Какого цвета была таблетка, которую принимает Нео в фильме “Матрица”?",
            answers: Answer(
                aAnswer: [true : "Красный"], bAnswer: [false : "Синий"],
                cAnswer: [false : "Зеленый"], dAnswer: [false : "Желтый"])),
        Question(
            question: "Символом какого ресторана является клоун?",
            answers: Answer(
                aAnswer: [true : "Макдональдс"], bAnswer: [false : "Бургер Кинг"],
                cAnswer: [false : "KFC"], dAnswer: [false : "Маленькие Цезари"])),
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
        Question(
            question: "Какой фрукт вдохновил Ньютона на открытия закона всемирного тятотения?",
            answers: Answer(
                aAnswer: [false : "Арбуз"], bAnswer: [true : "Яблоко"],
                cAnswer: [false : "Ананас"], dAnswer: [false : "Персик"])),
        Question(question: "Какая страна имеет 20 % мировых запасов пресной воды",
                 answers: Answer(
                    aAnswer: [true : "Канада"], bAnswer: [false : "Великобритания"],
                    cAnswer: [false : "Италия"], dAnswer: [false : "Испания"])),
        Question(
            question: "Что является национальным животным Шотландии?",
            answers: Answer(
                aAnswer: [false : "Лошадь"], bAnswer: [true : "Единорог"],
                cAnswer: [false : "Волк"], dAnswer: [false : "Корова"])),
        Question(
            question: "Какая страна производит больше всего кофе в мире?",
            answers: Answer(
                aAnswer: [false : "Колумбия"], bAnswer: [false : "Индонезия"],
                cAnswer: [true : "Бразилия"], dAnswer: [false : "Вьетнам"])),
        Question(
            question: "Как называется колокол часов Вестминстерского дворца в Лондоне?",
            answers: Answer(
                aAnswer: [true : "Биг Бен"], bAnswer: [false : "Броненосец"],
                cAnswer: [false : "Калабаш"], dAnswer: [false : "Мумия"])),
        Question(
            question: "Какой безалкогольный напиток первым был взят в космос?",
            answers: Answer(
                aAnswer: [false : "Пепси"], bAnswer: [false : "Фанта"],
                cAnswer: [true : "Кока-Кола"], dAnswer: [false : "Снапл"])),
        Question(
            question: "Как называется маленький пластмассовый кусочек на конце шнурка?",
            answers: Answer(
                aAnswer: [false : "Строка"], bAnswer: [false : "Чехол"],
                cAnswer: [false : "Кружево"], dAnswer: [true : "Аглет"])),
        Question(
            question: "Сколько длится мгновение?",
            answers: Answer(
                aAnswer: [false : "60 секунд"], bAnswer: [true : "90 секунд"],
                cAnswer: [false : "120 секунд"], dAnswer: [false : "180 секунд"])),
        Question(
            question: "Какая служба электронной почты принадлежит компании Microsoft?",
            answers: Answer(
                aAnswer: [true : "Outlook"], bAnswer: [false : "Yahoo Mail"],
                cAnswer: [false : "Gmail"], dAnswer: [false : "iCloud Mail"])),
        Question(
            question: "В какой стране были проведены первые Олимпийские игры?",
            answers: Answer(
                aAnswer: [false : "Италия"], bAnswer: [false : "Япония"],
                cAnswer: [true : "Греция"], dAnswer: [false : "Франция"])),
        Question(
            question: "Как долго длилась Столетняя война?",
            answers: Answer(
                aAnswer: [true : "116 лет"], bAnswer: [false : "100 лет"],
                cAnswer: [false : "50 лет"], dAnswer: [false : "101 год"])),
        Question(
            question: "Какое стихийное бедствие измеряется по шкале Рихтера?",
            answers: Answer(
                aAnswer: [false : "Торнадо"], bAnswer: [true : "Землетрясения"],
                cAnswer: [false : "Наводнения"], dAnswer: [false : "Ураган"])),
        Question(
            question: "Какая планета находится ближе всего к Солнцу?",
            answers: Answer(
                aAnswer: [false : "Земля"], bAnswer: [false : "Марс"],
                cAnswer: [true : "Меркурий"], dAnswer: [false : "Венера"])),
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
        Question(
            question: "Кто написал знаменитый дневник, скрываясь от нацистов в Амстердаме?",
            answers: Answer(
                aAnswer: [true : "Анна Франк"], bAnswer: [false : "Бриджит Джонс"],
                cAnswer: [false : "Мария Кюри"], dAnswer: [false : "Хелен Келлер"])),
        Question(
            question: "Что означает термин “пиано”?",
            answers: Answer(
                aAnswer: [false : "В бодром темпе"], bAnswer: [true : "В мягком темпе"],
                cAnswer: [false : "В умеренно медленном темпе"], dAnswer: [false : "В быстром темпе"])),
        Question(
            question: "Какая самая маленькая планета в нашей Солнечной системе?",
            answers: Answer(
                aAnswer: [false : "Земля"], bAnswer: [false : "Венера"],
                cAnswer: [false : "Марс"], dAnswer: [true : "Меркурий"])),
        Question(
            question: "Кто был главой государства в Японии во время второй мировой войны?",
            answers: Answer(
                aAnswer: [true : "Император Хирохито"], bAnswer: [false : "Император Муцухито"],
                cAnswer: [false : "Император Акихито"], dAnswer: [false : "Император Ёсихито"])),
        Question(
            question: "Сколько вкусовых рецепторов имеет средний человеческий язык?",
            answers: Answer(
                aAnswer: [false : "100"], bAnswer: [false : "1,000"],
                cAnswer: [true : "10,000"], dAnswer: [false : "100,000"])),
        Question(
            question: "Какова длина олимпийского плавательного бассейна?",
            answers: Answer(
                aAnswer: [false : "25 метров"], bAnswer: [true : "50 метров"],
                cAnswer: [false : "60 метров"], dAnswer: [false : "40 метров"])),
        Question(
            question: "Какая единственная страна принимала участие во всех чемпионатах мира по футболу?",
            answers: Answer(
                aAnswer: [true : "Бразилия"], bAnswer: [false : "Англия"],
                cAnswer: [false : "Испания"], dAnswer: [false : "Аргентина"])),
        Question(
            question: "Сколько колец на олимпийском флаге?",
            answers: Answer(
                aAnswer: [false : "Семь"], bAnswer: [false : "Шесть"],
                cAnswer: [true : "Пять"], dAnswer: [false : "Четыре"])),
        Question(
            question: "Сколько было пилотируемых высадок на Луну?",
            answers: Answer(
                aAnswer: [false : "Восемь"], bAnswer: [false : "Пять"],
                cAnswer: [true : "Шесть"], dAnswer: [false : "Семь"])),
        Question(
            question: "В каком году была подписана Декларация независимости США?",
            answers: Answer(
                aAnswer: [false : "1676"], bAnswer: [false : "1678"],
                cAnswer: [false : "1775"], dAnswer: [true : "1776"])),
        Question(
            question: "Каково было первоначальное название Нью-Йорка?",
            answers: Answer(
                aAnswer: [true : "Новый Амстердам"], bAnswer: [false : "Большое яблоко"],
                cAnswer: [false : "Имперский штат"], dAnswer: [false : "Готэм"])),
        Question(
            question: "Кто из отцов-основателей известен своей большой подписью на Декларации независимости Соединенных Штатов?",
            answers: Answer(
                aAnswer: [false : "Джордж Вашингтон"], bAnswer: [false : "Александр Гамильтон"],
                cAnswer: [false : "Бенджамин Франклин"], dAnswer: [true : "Джон Хэнкок"])),
        Question(
            question: "Кто написал роман “Убить пересмешника”, опубликованный в 1960 году?",
            answers: Answer(
                aAnswer: [false : "Роберт Фрост"], bAnswer: [false : "Джон Стейнбек"],
                cAnswer: [true : "Харпер Ли"], dAnswer: [false : "Дж. Д. Сэлинджер"])),
        Question(
            question: "Какая страна является самой маленькой в мире?",
            answers: Answer(
                aAnswer: [false : "Мальта"], bAnswer: [false : "Мальдивы"],
                cAnswer: [true : "Ватикан"], dAnswer: [false : "Монако"])),
        Question(
            question: "Из какого вещества состоят ногти?",
            answers: Answer(
                aAnswer: [false : "Серотонин"], bAnswer: [false : "Эпидермис"],
                cAnswer: [false : "Меланин"], dAnswer: [true : "Кератин"])),
        Question(
            question: "Что означает термин ДНК?",
            answers: Answer(
                aAnswer: [false : "Дезоксирибонуклеарная кислота"], bAnswer: [false : "Дуорибонуклеиновая кислота"],
                cAnswer: [false : "Дуоксирибонуклеиновая кислота"], dAnswer: [true : "Дезоксирибонуклеиновая кислота"])),
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
