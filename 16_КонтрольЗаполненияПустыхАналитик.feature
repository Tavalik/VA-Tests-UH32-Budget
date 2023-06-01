﻿#language: ru

@tree

Функционал: 16. Проверка контроля заполнения пустых аналитик

Как Администратор я хочу
чтобы нельзя было записать значение показателя с пустой аналитикой

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: 16.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 16.01 Создание вида отчета "ВА - Пустые аналитики"

	* Создаем вид отчета
		И Я создаю вид отчета с именем "ВА - Пустые аналитики" и родителем "ВА - Группа отчетов"
		И Я открываю вид отчета с именем "ВА - Пустые аналитики"
	
	* Доработаем вид отчета	
		И я перехожу к закладке с именем 'АналитикиОтчета'
		И из выпадающего списка с именем 'ВидАналитики1' я выбираю по строке "ВА0СтатДДС"
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'	
		Тогда открылось окно "Реструктуризация данных"
		И я нажимаю на кнопку с именем 'ФормаОК'

	* Настраиваем структуру вида отчета
		И я нажимаю на кнопку с именем 'РедактироватьДерево'
		Когда открылось окно "Конструктор отчета"
		И Я в конструкторе отчета добавляю строку с именем "Источник"
		И Я в конструкторе отчета добавляю строку с именем "Приемник1"
		И Я в конструкторе отчета добавляю строку с именем "Приемник2"
		И Я в конструкторе отчета добавляю колонку с именем "Число"
		И Я в конструкторе отчета добавляю колонку с именем "Дата"

	* Настраиваем показатели
		И Я в конструкторе отчета в ячейке 'R2C3:R4C3' меняю свойства показателей 'ТипЗначения' на "Дата"	

	* Настраиваем аналитики
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R2C3'
		И я нажимаю на кнопку с именем 'СкопироватьСоСмещениемВниз1'				
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0ТовКате" в ячейку 'R2C4'
		И я нажимаю на кнопку с именем 'СкопироватьСоСмещениемВниз1'

	* Устанавливаем обязателность заполнения аналитик	
		* ГР_Приемник1
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C9"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			Когда открылось окно 'ГР_Приемник1 (Группы аналитик показателей отчетов)'
			И в таблице "ТабНастройкаОтображенияПолей" я перехожу к строке:
				| 'Аналитика группы'          | 'Вид аналитики' | 'Обязательная' |
				| 'Аналитика 2: Номенклатура' | 'Номенклатура'  | 'Нет'          |
			И в таблице "ТабНастройкаОтображенияПолей" я активизирую поле с именем "ОбязательнаяАналитика"
			И в таблице "ТабНастройкаОтображенияПолей" я изменяю флаг с именем 'ОбязательнаяАналитика'
			И в таблице "ТабНастройкаОтображенияПолей" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ГР_Приемник1 (Группы аналитик показателей отчетов) *' в течение 20 секунд
		* ГР_Приемник2
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C9"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			Когда открылось окно 'ГР_Приемник2 (Группы аналитик показателей отчетов)'
			И в таблице "ТабНастройкаОтображенияПолей" я перехожу к строке:
				| 'Аналитика группы'          | 'Вид аналитики' | 'Обязательная' |
				| 'Аналитика 2: Номенклатура' | 'Номенклатура'  | 'Нет'          |
			И в таблице "ТабНастройкаОтображенияПолей" я активизирую поле с именем "ОбязательнаяАналитика"
			И в таблице "ТабНастройкаОтображенияПолей" я изменяю флаг с именем 'ОбязательнаяАналитика'
			И в таблице "ТабНастройкаОтображенияПолей" я завершаю редактирование строки
			И в таблице "ТабНастройкаОтображенияПолей" я перехожу к строке:
				| 'Аналитика группы'                | 'Вид аналитики'      | 'Обязательная' |
				| 'Аналитика 3: Товарные категории' | 'Товарные категории' | 'Нет'          |
			И в таблице "ТабНастройкаОтображенияПолей" я активизирую поле с именем "ОбязательнаяАналитика"
			И в таблице "ТабНастройкаОтображенияПолей" я изменяю флаг с именем 'ОбязательнаяАналитика'
			И в таблице "ТабНастройкаОтображенияПолей" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ГР_Приемник2 (Группы аналитик показателей отчетов) *' в течение 20 секунд

	* Закрываем конструктор
		Когда открылось окно 'Конструктор отчета'
		И Я закрываю окно 'Конструктор отчета'
		
	* Бланк вида отчета
		И Я Для вида отчета "ВА - Пустые аналитики" я создаю бланк по умолчанию

Сценарий: 16.02 Настраиваем формулы через 

	И Я открываю контруктор отчета с именем "ВА - Пустые аналитики"

	* Ввод формул
		Когда открылось окно 'Конструктор отчета'
		И из выпадающего списка с именем "РежимРаботы" я выбираю точное значение "Формулы расчета показателей"				
		И я нажимаю на кнопку с именем 'ФормаПоказатьИсходныеДанные'
		И из выпадающего списка с именем "ВидОтчетаОтбор" я выбираю по строке 'ВА - Пустые аналитики'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
		И в табличном документе 'ТабДокВыборПоказателя' я перехожу к ячейке "Источник_Число"
		// ДОРАБОТАТЬ
		// Сделать ввод формулы по двойному клику
		Тогда открылось окно 'Конструктор отчета'
		И я нажимаю на кнопку с именем 'ДобавитьДанныеВЯчейку1'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C3"
		И в табличном документе 'ТабДокВыборПоказателя' я перехожу к ячейке "Источник_Дата"
		И я нажимаю на кнопку с именем 'ДобавитьДанныеВЯчейку1'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C2"
		И в табличном документе 'ТабДокВыборПоказателя' я перехожу к ячейке "Источник_Число"
		И я нажимаю на кнопку с именем 'ДобавитьДанныеВЯчейку1'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C3"
		И в табличном документе 'ТабДокВыборПоказателя' я перехожу к ячейке "Источник_Дата"
		И я нажимаю на кнопку с именем 'ДобавитьДанныеВЯчейку1'
		И я нажимаю на кнопку с именем 'ФормаПоказатьИсходныеДанные'

	* Настройка аналитик
		* Приемник1 число
			Когда открылось окно 'Конструктор отчета'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C2"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно 'Источники данных'
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
			Тогда открылось окно 'ВА - Пустые аналитики_Источник число (Источник данных)'
			И в таблице "ТаблицаСоответствия" я перехожу к строке:
				| 'Аналитика приемника'             | 'Вид аналитики'      | 'Имя колонки'                       | 'Способ заполнения' |
				| 'Аналитика 3: Товарные категории' | 'Товарные категории' | '[Аналитика 3: Товарные категории]' | 'Поле источника'    |
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Пустые аналитики_Источник число (Источник данных) *' в течение 20 секунд
			Тогда открылось окно 'Источники данных'
			И Я закрываю окно 'Источники данных'
			Тогда открылось окно 'Конструктор отчета'
			И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
		* Приемник1 дата		
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R3C3"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно 'Источники данных'
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
			Тогда открылось окно 'ВА - Пустые аналитики_Источник дата (Источник данных)'
			И в таблице "ТаблицаСоответствия" я перехожу к строке:
				| 'Аналитика приемника'             | 'Вид аналитики'      | 'Имя колонки'                       | 'Способ заполнения' |
				| 'Аналитика 3: Товарные категории' | 'Товарные категории' | '[Аналитика 3: Товарные категории]' | 'Поле источника'    |
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Пустые аналитики_Источник дата (Источник данных) *' в течение 20 секунд
			Тогда открылось окно 'Источники данных'
			И Я закрываю окно 'Источники данных'
			Тогда открылось окно 'Конструктор отчета'
			И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
		* Приемник2 число
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C2"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно 'Источники данных'
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
			Тогда открылось окно 'ВА - Пустые аналитики_Источник число (Источник данных)'
			И в таблице "ТаблицаСоответствия" я перехожу к строке:
				| 'Аналитика приемника'             | 'Вид аналитики'      | 'Имя колонки'                       | 'Способ заполнения' |
				| 'Аналитика 3: Товарные категории' | 'Товарные категории' | '[Аналитика 3: Товарные категории]' | 'Поле источника'    |
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Пустые аналитики_Источник число (Источник данных) *' в течение 20 секунд
			Тогда открылось окно 'Источники данных'
			И Я закрываю окно 'Источники данных'
			Тогда открылось окно 'Конструктор отчета'
			И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'
		* Приемник2 дата
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R4C3"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
			И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
			Тогда открылось окно 'Источники данных'
			И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
			Тогда открылось окно 'ВА - Пустые аналитики_Источник дата (Источник данных)'
			И в таблице "ТаблицаСоответствия" я перехожу к строке:
				| 'Аналитика приемника'             | 'Вид аналитики'      | 'Имя колонки'                       | 'Способ заполнения' |
				| 'Аналитика 3: Товарные категории' | 'Товарные категории' | '[Аналитика 3: Товарные категории]' | 'Поле источника'    |
			И в таблице "ТаблицаСоответствия" я активизирую поле с именем "ТаблицаСоответствияСпособЗаполнения"
			И в таблице "ТаблицаСоответствия" я выбираю текущую строку
			И в таблице "ТаблицаСоответствия" из выпадающего списка с именем "ТаблицаСоответствияСпособЗаполнения" я выбираю точное значение 'Фиксированное значение'
			И в таблице "ТаблицаСоответствия" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Пустые аналитики_Источник дата (Источник данных) *' в течение 20 секунд
			Тогда открылось окно 'Источники данных'
			И Я закрываю окно 'Источники данных'
			Тогда открылось окно 'Конструктор отчета'
			И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'

	* Закрываем конструктор
		Когда открылось окно 'Конструктор отчета'
		И Я закрываю окно 'Конструктор отчета'		

Сценарий: 16.03 Создание экземпляра отчета "ВА - Пустые аналитики"

	И Я создаю экземпляр отчета для вида отчета "ВА - Пустые аналитики" сценарий "ВА - Основной сценарий" период '01.01.2021' '31.03.2021' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики 'Реализация программных продуктов' '' '' '' '' ''
	И я нажимаю на кнопку с именем 'Записать'

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C8'
		| "Номенклатура"                 | "Товарные категории"   | 'Период_1_Значение1' | 'Период_2_Значение1' |
		| "1С:Управление холдингом 8"    | "Программные продукты" | '100'                | '200'                |
		| "1С:ERP. Управление холдингом" | "Программные продукты" | '100'                | '200'                |

	И Я добавляю значения с раскрытием показателей в ячейку 'R6C9'
		| "Номенклатура"                 | "Товарные категории"   | 'Период_1_Значение1' | 'Период_2_Значение1' |
		| "1С:Управление холдингом 8"    | "Программные продукты" | '01.01.2021'         | '02.02.2021'         |
		| "1С:ERP. Управление холдингом" | "Программные продукты" | '01.01.2021'         | '02.02.2021'         |

	И Я ввожу комментарий "Число" в ячейку 'R8C2'
	И Я ввожу комментарий "Дата" в ячейку 'R10C5'

	Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
		| 'ВА - Пустые аналитики'         | ''               | ''           | ''                | ''           | ''             | ''     | ''      | ''           |
		| ''                              | ''               | ''           | ''                | ''           | ''             | ''     | ''      | ''           |
		| ''                              | 'Январь 2021 г.' | ''           | 'Февраль 2021 г.' | ''           | 'Март 2021 г.' | ''     | 'ИТОГО' | ''           |
		| ''                              | 'Число'          | 'Дата'       | 'Число'           | 'Дата'       | 'Число'        | 'Дата' | 'Число' | 'Дата'       |
		| 'Источник'                      | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
		| '1С:ERP. Управление холдингом ' | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| 'Программные продукты '         | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| '1С:Управление холдингом 8 '    | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| 'Программные продукты '         | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| 'Приемник1'                     | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
		| '1С:ERP. Управление холдингом ' | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| ' '                             | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| '1С:Управление холдингом 8 '    | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| ' '                             | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| 'Приемник2'                     | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
		| '1С:ERP. Управление холдингом ' | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| ' '                             | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| '1С:Управление холдингом 8 '    | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
		| ' '                             | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |

	Когда открылось окно '$ЗаголовокОкна$'
	И я нажимаю на кнопку с именем 'Записать'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'OK'

	Тогда в логе сообщений TestClient есть строки:
		|'Не заполнена обязательная аналитика для показателя:\n	Показатель: "Приемник2 число"\n	Аналитика3: "Товарные категории"'|
		|'Не заполнена обязательная аналитика для показателя:\n	Показатель: "Приемник2 дата"\n	Аналитика3: "Товарные категории"'|

	Когда открылось окно '$ЗаголовокОкна$'
	И Я закрываю окно '$ЗаголовокОкна$'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'		
		
Сценарий: 16.04 Создание сводной таблицы "ВА - Пустые аналитики"		

	И Я для вида отчета "ВА - Пустые аналитики" я создаю бланк сводной таблицы по умолчанию с отборами ""
		
	И Я октрываю сводную таблицу отчета с именем "ВА - Пустые аналитики"
	И Я устанавливаю отборы сводной таблицы: дата начала '01.01.2021', дата конца '31.03.2021', валюта 'RUB', сценарий "ВА - Основной сценарий", организация "Меркурий ООО"		

	И Я добавляю значения с раскрытием показателей в ячейку 'R4C8'
		 | "Номенклатура"                 | "Товарные категории"   | "Статьи ДДС"                       | 'Период_1_Значение1' | 'Период_2_Значение1' |
		 | "1С:Управление холдингом 8"    | "Программные продукты" | "Реализация программных продуктов" | '100'                | '200'                |
		 | "1С:ERP. Управление холдингом" | "Программные продукты" | "Внедрение программных продуктов"  | '100'                | '200'                |

	И Я добавляю значения с раскрытием показателей в ячейку 'R4C9'
		| "Номенклатура"                 | "Товарные категории"   | 'Статьи ДДС'                       | 'Период_1_Значение1' | 'Период_2_Значение1' |
		| "1С:Управление холдингом 8"    | "Программные продукты" | "Реализация программных продуктов" | '01.01.2021'         | '02.02.2021'         |
		| "1С:ERP. Управление холдингом" | "Программные продукты" | "Внедрение программных продуктов"  | '01.01.2021'         | '02.02.2021'         |

	И Я ввожу комментарий "Число" в ячейку 'R7C2'
	И Я ввожу комментарий "Дата" в ячейку 'R10C5'

	* Сверяем результат
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Пустые аналитики (сводная таблица)' | 'Январь 2021 г.' | ''           | 'Февраль 2021 г.' | ''           | 'Март 2021 г.' | ''     | 'ИТОГО' | ''           |
			| 'ВА - Пустые аналитики (сводная таблица)' | 'Число'          | 'Дата'       | 'Число'           | 'Дата'       | 'Число'        | 'Дата' | 'Число' | 'Дата'       |
			| 'Источник'                                | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
			| 'Внедрение программных продуктов'         | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:ERP. Управление холдингом'            | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Программные продукты'                    | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Реализация программных продуктов'        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:Управление холдингом 8'               | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Программные продукты'                    | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Приемник1'                               | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
			| 'Внедрение программных продуктов'         | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:ERP. Управление холдингом'            | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| ''                                        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Реализация программных продуктов'        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:Управление холдингом 8'               | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| ''                                        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Приемник2'                               | '200'            | '01.01.2021' | '400'             | '02.02.2021' | '0'            | ''     | '600'   | '02.02.2021' |
			| 'Внедрение программных продуктов'         | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:ERP. Управление холдингом'            | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| ''                                        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| 'Реализация программных продуктов'        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| '1С:Управление холдингом 8'               | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
			| ''                                        | '100'            | '01.01.2021' | '200'             | '02.02.2021' | '0'            | ''     | '300'   | '02.02.2021' |
	
	* Открываем экземпляр отчета
		Когда открылось окно "Сводная таблица: *"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R10C3"
		И я выбираю пункт контекстного меню с именем 'ПолеТабличногоДокументаМакетКонтекстноеМенюОткрытьЭкземплярОтчета' на элементе формы с именем "ПолеТабличногоДокументаМакет"
		И Открылся экземпляр отчета для вида отчета "ВА - Пустые аналитики" валюта "RUB" организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность "Месяц"  проект '' аналитики 'Реализация программных продуктов' '' '' '' '' ''
		И Я закрываю окно '$ЗаголовокОкна$'

	* Открываем несуществующий экземпляр отчета
		Когда открылось окно "Сводная таблица: *"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R7C3"
		И я выбираю пункт контекстного меню с именем 'ПолеТабличногоДокументаМакетКонтекстноеМенюОткрытьЭкземплярОтчета' на элементе формы с именем "ПолеТабличногоДокументаМакет"
		Тогда в логе сообщений TestClient есть строки:
			|'Не найден экземпляр отчета по ключевым срезам:\n	Сценарий: ВА - Основной сценарий,\n	Организация: Меркурий ООО,\n	Период: Январь 2021 г.,\n	Аналитика1: Внедрение программных продуктов'|
	
	Когда открылось окно "Сводная таблица: *"
	И я нажимаю на кнопку с именем 'Применить'

	Тогда открылось окно "Протокол"		
	Тогда табличный документ "ПолеТабличногоДокумента" равен:
		| 'Ошибки'                                                                                                                 |
		| 'Не заполнена обязательная аналитика для показателя:\n	Показатель: "Приемник2 число"\n	Аналитика3: "Товарные категории"' |
		| 'Не заполнена обязательная аналитика для показателя:\n	Показатель: "Приемник2 дата"\n	Аналитика3: "Товарные категории"'  |
		