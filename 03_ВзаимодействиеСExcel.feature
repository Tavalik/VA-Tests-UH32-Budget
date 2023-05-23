﻿#language: ru

@tree

Функционал: 03. Выгрузука бланков и загрузка экземпляров отчетов из Excel

Как Администратор я хочу 
проверить что выгрузка и загрузка из Excel работы 
чтобы загружать экземпляры отчетов из файлов

Контекст: 

	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 03.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 03.01 Создание отчета с группами и 6 аналитиками

	И Я создаю вид отчета с именем "ВА - ИмпортExcel" и родителем "ВА - Группа отчетов"

	* Создаем строки отчета
		И Я открываю контруктор отчета с именем "ВА - ИмпортExcel"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Синтетика_1"
		И Я в конструкторе отчета добавляю строку с именем "Группа_Синтетика"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Синтетика_2"
		И Я в конструкторе отчета добавляю строку с именем "Группа_Аналитики_0"
		И Я в конструкторе отчета добавляю строку с именем "Группа_Аналитики_1_2"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Аналитики_1"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Аналитики_2"
		И Я в конструкторе отчета добавляю строку с именем "Группа_Аналитики_6"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Аналитики_6"
		И Я в конструкторе отчета добавляю строку с именем "Группа_Валюта"
		И Я в конструкторе отчета добавляю строку с именем "Строка_Аналитики_6_Валюта"

	* Задаем иерархию строк
		И Я в конструкторе отчета в ячейке 'R6C1' я меняю родителя у строки на "Группа_Аналитики_0"
		И Я в конструкторе отчета в ячейке 'R9C1' я меняю родителя у строки на "Группа_Аналитики_0"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Группа_Валюта"
		И Я в конструкторе отчета в ячейке 'R11C1' я меняю родителя у строки на "Группа_Аналитики_6"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Группа_Аналитики_6"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Группа_Аналитики_1_2"
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на "Группа_Аналитики_1_2"
		И Я в конструкторе отчета в ячейке 'R4C1' я меняю родителя у строки на "Группа_Синтетика"
	
	* Создаем колонки отчета
		И Я в конструкторе отчета добавляю колонку с именем "Количество"
		И Я в конструкторе отчета добавляю колонку с именем "Сумма"

	* Вводим аналитики
		* Аналитика "Контрагенты"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Контраг" в ячейку 'R7C2' 	
			Тогда открылось окно "Конструктор отчета"
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R8C2'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C2'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C2'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика "Договоры контрагентов"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0ДогКонт" в ячейку 'R8C3'
			Тогда открылось окно "Конструктор отчета"
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C3'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C3'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика "Товарные категории"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0ТовКате" в ячейку 'R10C4'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C4'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика "Номенклатура"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R10C5'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C5'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика "Статьи ДДС"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R10C6'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C6'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика "Статьи доходов и расходов"
			И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СДохРас" в ячейку 'R10C7'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C7'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитка валюта
			Когда открылось окно "Конструктор отчета"
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C8'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке

	* Сравниваем результат
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'Строка'                    | "Аналитика 1" | "Аналитика 2"           | "Аналитика 3"        | "Аналитика 4"  | "Аналитика 5" | "Аналитика 6"               | "Раскрытие по валютам" | "Настройки" |
			| "Строка_Синтетика_1"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Группа_Синтетика"          | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Строка_Синтетика_2"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Группа_Аналитики_0"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Группа_Аналитики_1_2"      | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Строка_Аналитики_1"        | "Контрагенты" | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Строка_Аналитики_2"        | "Контрагенты" | "Договоры контрагентов" | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Группа_Аналитики_6"        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Строка_Аналитики_6"        | "Контрагенты" | "Договоры контрагентов" | "Товарные категории" | "Номенклатура" | "Статьи ДДС"  | "Статьи доходов и расходов" | ''                     | ''          |
			| "Группа_Валюта"             | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| "Строка_Аналитики_6_Валюта" | "Контрагенты" | "Договоры контрагентов" | "Товарные категории" | "Номенклатура" | "Статьи ДДС"  | "Статьи доходов и расходов" | '■'                    | ''          |

	* Настраиваем формулы расчета
		Когда открылось окно "Конструктор отчета"
		И из выпадающего списка с именем 'РежимРаботы' я выбираю точное значение "Формулы расчета показателей"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C2'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R3C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R4C3'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R6C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R9C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R5C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R6C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'КнопкаПлюс'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R9C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R6C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R7C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R7C2:R8C2'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R6C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R7C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R7C3:R8C3'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R9C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C2'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R9C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C3'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R11C2'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C2'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'
		Тогда открылось окно "Конструктор отчета"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R11C3'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C3'
		И я нажимаю на кнопку с именем 'КнопкаСумма'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

	* Настраиваем тип информационной базы
		Когда открылось окно "Конструктор отчета"
		И я нажимаю на кнопку открытия поля с именем 'ПравилоОбработки'
		Тогда открылось окно "ВА - ИмпортExcel (Правила расчета)"
		И из выпадающего списка с именем 'ТипБД' я выбираю по строке "Файлы Microsoft Excel"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "ВА - ИмпортExcel (Правила расчета) *" в течение 20 секунд

Сценарий: 03.02 Создание внешней информационной базы

	И Я создаю внешнюю информационную базу "ВА - Импорт из Excel" тип 'Файлы Microsoft Excel' каталог '$КаталогПроекта$\Макеты' тип хранилища ''

	* Тестируем механизм маски имени
		Тогда элемент формы с именем 'МаскаПолногоИмени' стал равен "$КаталогПроекта$\Макеты\*.xls?"
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'СтруктураИмениЗаполнить'
		Тогда таблица 'СтруктураИмени' стала равной:
			| "Разделитель"  | "Ключевой реквизит" |
			| "\\"           | "Период сценария"   |
			| "\\"           | "Сценарий"          |
			| "\\"           | "Организация"       |
			| "\\"           | "Проект"            |
			| "\\"           | "Вид отчета"        |
		Тогда элемент формы с именем "МаскаПолногоИмени" стал равен "$КаталогПроекта$\Макеты\<Период сценария>\<Сценарий>\<Организация>\<Проект>\<Вид отчета>.xls?"
		Когда открылось окно '$ЗаголовокОкна$'
		И в таблице 'СтруктураИмени' я перехожу к строке:
			| "Разделитель" | "Ключевой реквизит" |
			| "\\"          | "Период сценария"   |
		И я нажимаю на кнопку с именем 'СтруктураИмениУдалить'
		И я нажимаю на кнопку с именем 'СтруктураИмениУдалить'
		И я нажимаю на кнопку с именем 'СтруктураИмениУдалить'
		И я нажимаю на кнопку с именем 'СтруктураИмениУдалить'
		И я нажимаю на кнопку с именем 'СтруктураИмениДобавить'
		И в таблице 'СтруктураИмени' из выпадающего списка с именем 'СтруктураИмениНачалоЭлемента' я выбираю точное значение "+"
		И в таблице 'СтруктураИмени' из выпадающего списка с именем 'СтруктураИмениЭлемент' я выбираю точное значение "Организация"
		И в таблице "СтруктураИмени" я отменяю редактирование строки
		Тогда элемент формы с именем 'МаскаПолногоИмени' стал равен "$КаталогПроекта$\Макеты\<Вид отчета>+<Организация>.xls?"

	* Наставиваем элементы пути	
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОткрытьНастройкиОбменаФайламиОрганизаций'
		И Я добавляю элемент пути к файлам организаций для типа "Организация" объект "Меркурий ООО" значение "Меркурий"
		И Я добавляю элемент пути к файлам организаций для типа "ВидОтчета" объект "ВА - ИмпортExcel" значение "ВА_ИмпортExcel"
		Тогда открылось окно "Элементы пути к файлам организаций: Форма списка"
		И я нажимаю на кнопку с именем 'ФормаЗакрыть'

	* Записываем и закрываем элемент
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 03.03 Создание многопериодного бланка отчета и выгузка в Excel

	* Найдем вид отчета
		И Я нахожу в списке вид отчета с именем "ВА - ИмпортExcel"
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"     |
			| "ВА - ИмпортExcel" |
		И в таблице 'Список' я активизирую поле с именем 'Наименование'
		И в таблице 'Список' я выбираю текущую строку

	* Создаем бланк
		Тогда Открылся бланк для вида отчета "ВА - ИмпортExcel"
		И я запоминаю текущее окно как 'ЗаголовокОкна'
		И я нажимаю на кнопку с именем 'ПоказатьПанельПоказателей'
		И из выпадающего списка с именем 'БланкДляОтображения' я выбираю точное значение "Для импорта и отображения"
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Структура отчета"
		И из выпадающего списка с именем 'ШаблонОформленияБланковОтчетов' я выбираю по строке "Классический"
		И я снимаю флаг с именем 'ВыводитьРеквизиты'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Записываем бланк
		Тогда открылось окно '$ЗаголовокОкна$ *'
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'

	* Сохраняем бланк
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Экспортировать'
		Тогда открылось окно "Сохранение макета отчета"
		И из выпадающего списка с именем 'ВнешняяИБ' я выбираю по строке "ВА - Импорт из Excel"
		И в поле с именем 'ИмяФайлаВыгрузки' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Шаблон.xlsx'
		И из выпадающего списка с именем 'Периодичность' я выбираю точное значение "Месяц"
		И в поле с именем 'КоличествоПериодов' я ввожу текст '3'
		И я нажимаю на кнопку с именем 'ФормаВыгрузить'
		Тогда открылось окно '$ЗаголовокОкна$'
		И Я закрываю окно '$ЗаголовокОкна$'
		Когда открылось окно "Виды и бланки отчетов"
		И Я закрываю окно "Виды и бланки отчетов"

	* Сравниваем файл
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Сравнение табличных документов"
		Тогда открылось окно "Сравнение табличных документов"
		И в поле с именем 'ПутьКДокументу1' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Шаблон.xlsx'
		И в поле с именем 'ПутьКДокументу2' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.mxl'
		И я устанавливаю флаг с именем 'СравниватьТолькоЗначения'
		И я устанавливаю флаг с именем 'СравниватьПоШаблону'								
		И я нажимаю на кнопку с именем 'ФормаСравнитьДокументы'
		Тогда открылось окно "Документы идентичны: Сравнение табличных документов"
		И Я закрываю окно "Документы идентичны: Сравнение табличных документов"

	* Настраиваем сортировку
		И Я Для вида отчета "ВА - ИмпортExcel" в бланке для группы раскрытия с адресом 'R18C1' меняю сортировку "Номенклатура" "Наименование" на сортировку "Номенклатура" "Артикул"
		И Я Для вида отчета "ВА - ИмпортExcel" в бланке для группы раскрытия с адресом 'R21C1' меняю сортировку "Номенклатура" "Наименование" на сортировку "Номенклатура" "Артикул"	

Сценарий: 03.04 Создание экземпляра отчета - "ВА - ИмпортExcel"	и загрузка из файла

	И Я создаю экземпляр отчета для вида отчета "ВА - ИмпортExcel" сценарий "ВА - Основной сценарий" период '01.01.2021' '31.03.2021' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики '' '' '' '' '' '' 
		
	* Документ должен быть пуст
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Пустой.mxl'

	* Загружаем без файла
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Когда открылось окно "Выбор способа расчета показателей"
		И из выпадающего списка с именем 'СпособФормированияОтчета' я выбираю точное значение "Импорт"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Когда открылось окно '$ЗаголовокОкна$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Не указан путь к импортируемому файлу. Операция отменена." в течение 30 секунд
		И я очищаю окно сообщений пользователю
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Пустой.mxl'		

	* Загружаем ошибочный файл
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'		
		Когда открылось окно "Выбор способа расчета показателей"
		Тогда у элемента формы с именем 'СпособФормированияОтчета' текст редактирования стал равен "Импорт"
		Тогда у элемента формы с именем 'БланкИмпорта' текст редактирования стал равен "ВА - ИмпортExcel"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Ошибка.xlsx"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'		
		Когда открылось окно "Протокол"
		Тогда табличный документ "ПолеТабличногоДокумента" равен по шаблону:
			| 'Ошибки'                                            |
			| 'В файле * не найдена строка *. Импорт остановлен.' |
		И я закрываю окно "Протокол"
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Пустой.mxl'

	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'		
		Когда открылось окно "Выбор способа расчета показателей"
		Тогда у элемента формы с именем 'СпособФормированияОтчета' текст редактирования стал равен "Импорт"
		Тогда у элемента формы с именем 'БланкИмпорта' текст редактирования стал равен "ВА - ИмпортExcel"
		Тогда у элемента формы с именем 'ФайлИмпорта' текст редактирования стал равен "ВА_ИмпортExcel+Ошибка.xlsx"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на 'Файл на диске'
		Тогда у элемента формы с именем 'ПутьКФайлу' текст редактирования стал равен "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Ошибка.xlsx"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Меркурий.xlsx"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'				
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'

	* Проверяем историю действий
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОтменитьПрименитьПодробно'
		Тогда открылось окно "История действий"
		Тогда таблица 'Транзакции' стала равной:
			| "Представление транзакции" |
			| "Загрузка из MS Excel"     |
		И я нажимаю на кнопку с именем 'ФормаОтмена'

	* Настраиваем Регламент
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОткрытьНастройки'
		Тогда открылось окно "Редактирование настроек отчета"
		И я нажимаю на кнопку с именем 'ОткрытьНастройкиРегламента'
		Тогда открылось окно "Настройка правил заполнения объектов для регламента ВА - Основной регламент"
		И в табличном документе 'ПолеНастройки' я перехожу к ячейке "R2C3"
		И в табличном документе 'ПолеНастройки' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Настройка правил заполнения отчетов"
		И из выпадающего списка с именем 'СпособФормированияОтчета' я выбираю точное значение "Импорт"
		И из выпадающего списка с именем 'ВнешнийИсточник' я выбираю по строке "ВА - Импорт из Excel"
		Тогда элемент формы с именем 'БланкИмпорта' стал равен "ВА - ИмпортExcel"				
		
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'"
		Тогда открылось окно "Настройка правил заполнения объектов для регламента ВА - Основной регламент"
		И я нажимаю на кнопку с именем 'ФормаПрименитьНастройки'
		И Я закрываю окно "Настройка правил заполнения объектов для регламента ВА - Основной регламент"
		Тогда открылось окно "Редактирование настроек отчета"
		И я нажимаю на кнопку с именем 'ФормаПрименитьИЗакрыть'

	* Записываем документ	
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 30 секунд

Сценарий: 03.05 Повторная загрузка данных из файла

	И Я открываю первый экземпляр отчета для вида отчета "ВА - ИмпортExcel"
	Тогда Открылся экземпляр отчета для вида отчета "ВА - ИмпортExcel" валюта 'RUB' организация "Меркурий ООО" сценарий "ВА - Основной сценарий" периодичность "Месяц" проект '' аналитики '' '' '' '' '' '' 
	
	* Очищаем показатели
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Редактирование'
		И я нажимаю на кнопку с именем 'Очистить'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Пустой.mxl'
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Записать'				

	* Грузим файл повторно
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Когда открылось окно "Выбор способа расчета показателей"
		И из выпадающего списка с именем 'СпособФормированияОтчета' я выбираю точное значение "Импорт"
		И элемент формы с именем 'СпособИмпортирования' стал равен 'ИзСправочника'
		И элемент формы с именем 'ФайлИмпорта' стал равен 'ВА_ИмпортExcel+Меркурий*' по шаблону
		И элемент формы с именем 'БланкИмпорта' стал равен "ВА - ИмпортExcel"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Когда открылось окно "Выбор версии файла"
		И таблица 'СписокЛистов' стала равной:
			| "Лист документа" | "Защищен паролем" |
			| 'TDSheet'        | "Нет"             |
		И я нажимаю на кнопку с именем 'ФормаОК'

	* Сверяем результат			
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'

	* Отменяем загрузку
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Пустой.mxl'

	* Рассчитываем по регламенту
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'

	* Сверяем результат, записываем документ
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'
		И я нажимаю на кнопку с именем 'Записать'					

	* Вибираем второй файл
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Когда открылось окно "Выбор способа расчета показателей"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Файл на диске"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Меркурий_2.xlsm"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Сверяем результат	
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2.mxl'	
	
	* Заполняем из внешней базы
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Когда открылось окно "Выбор способа расчета показателей"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Внешняя информационная база"
		И из выпадающего списка с именем 'ИспользуемаяИБИмпорт' я выбираю по строке "ВА - Импорт из Excel"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Сверяем результат
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'									

	* Откатывамем расчет
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2.mxl'		

	* Закрываем документ
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 03.06 Создаем бланк сводной таблицы

	И Я для вида отчета "ВА - ИмпортExcel" я создаю бланк сводной таблицы по умолчанию с отборами

	И Я Для вида отчета "ВА - ИмпортExcel" открываю бланк сводной таблицы по умолчанию

	* Настраиваем порядок аналитик
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиТаблицыПоОсям'
		И Я в сводной таблице перемещаю аналитику с именем "Дополнительные валюты" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Статьи доходов и расходов" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Статьи ДДС" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Номенклатура" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Товарные категории" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Договоры контрагентов" вверх
		И Я в сводной таблице перемещаю аналитику с именем "Контрагенты" вверх

	* Настраиваем сортировку аналитики Номенклатура
		Когда открылось окно "Настройка расположения полей"
		И в таблице 'ТаблицаСтроки' я перехожу к строке:
			| "По горизонтали (в строках)" |
			| "Номенклатура"               |
		И в таблице 'ТаблицаСтроки' я выбираю текущую строку
		Тогда открылось окно "Параметры вывода аналитики (Номенклатура)"
		И я нажимаю кнопку выбора у поля с именем 'НастройкиКДНастройкиПорядок'
		Тогда открылось окно "Редактирование порядка"
		И в таблице 'Data' я выбираю текущую строку
		И в таблице 'Data' из выпадающего списка с именем 'DataПоле' я выбираю точное значение "Номенклатура.Артикул"
		И в таблице 'Data' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'OK'
		Когда открылось окно "Параметры вывода аналитики (Номенклатура)"
		И элемент формы с именем 'НастройкиКДНастройкиПорядок' стал равен "Номенклатура.Артикул"
		И элемент формы с именем 'ПоддерживатьИерархию1' стал равен 'Нет'
		И я нажимаю на кнопку с именем 'ФормаПрименить'

	* Настраиваем вывод аналитик
		Когда открылось окно "Настройка расположения полей"
		И я нажимаю на кнопку с именем 'ВариантРасположенияАналитик'
		И в меню формы я выбираю "Аналитики рядом"
		И я изменяю флаг с именем 'ИтогПоКолонокам'
		И я нажимаю на кнопку с именем 'КнопкаПрименить'
	
	* Записываем бланк
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 03.07 Создаем сводную таблицу

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "ВА - ИмпортExcel"
		И Я устанавливаю отборы сводной таблицы: дата начала '01.01.2021', дата конца '31.03.2021', валюта 'RUB', сценарий "ВА - Основной сценарий", организация "Меркурий ООО"	

	* Сверяем таблицу
		Когда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'

	* Загружаем без файла	
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ПересчитатьПрочие'
		Тогда открылось окно "Выбор способа расчета показателей"
		И из выпадающего списка с именем 'СпособФормированияОтчета' я выбираю точное значение "Импорт"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Когда открылось окно '$ЗаголовокОкна$'
		Затем я жду, что в сообщениях пользователю будет подстрока "Не указан путь к импортируемому файлу. Операция отменена." в течение 30 секунд
		И я очищаю окно сообщений пользователю

	* Загружаем ошибочный файл
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ПересчитатьПрочие'		
		Когда открылось окно "Выбор способа расчета показателей"
		Тогда у элемента формы с именем 'СпособФормированияОтчета' текст редактирования стал равен "Импорт"
		Тогда у элемента формы с именем 'БланкИмпорта' текст редактирования стал равен "ВА - ИмпортExcel"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Ошибка.xlsx"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		И я жду открытия окна "Протокол" в течение 20 секунд
		Тогда табличный документ "ПолеТабличногоДокумента" равен по шаблону:
			| 'Ошибки'                                            |
			| 'В файле * не найдена строка *. Импорт остановлен.' |
		И я закрываю окно "Протокол"
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'	

	* Загружаем по регламенту
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ПересчитатьПоРегламенту'
		И я жду открытия формы '$ЗаголовокОкна$' в течение 30 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_СТ.mxl'	

	* Откатываем изменения
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОтменитьДействие'
		И я жду открытия формы '$ЗаголовокОкна$' в течение 30 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'							

	* Загружаем по внешней информационной базе
		И я нажимаю на кнопку с именем 'ПересчитатьПрочие'		
		Когда открылось окно "Выбор способа расчета показателей"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Внешняя информационная база"
		И из выпадающего списка с именем 'ИспользуемаяИБИмпорт' я выбираю по строке "ВА - Импорт из Excel"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'			
		И я жду открытия формы '$ЗаголовокОкна$' в течение 30 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_СТ.mxl'	

	* Очищаем часть показателей
		Тогда открылось окно '$ЗаголовокОкна$'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R10C9:R28C9"
		И я нажимаю на кнопку с именем 'ОчиститьДиапазон'
	
	* Загружаем с файлом
		И я нажимаю на кнопку с именем 'ПересчитатьПрочие'		
		Когда открылось окно "Выбор способа расчета показателей"
		И я меняю значение переключателя с именем 'СпособИмпортирования' на "Файл на диске"
		И в поле с именем 'ПутьКФайлу' я ввожу текст "$КаталогПроекта$\Макеты\ВА_ИмпортExcel+Меркурий_2.xlsm"
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Сверяем результат	
		И я жду открытия формы '$ЗаголовокОкна$' в течение 30 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'

	* Проверяем историю действий
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ОтменитьПрименитьПодробно'
		Тогда открылось окно "История действий"
		Тогда таблица 'Транзакции' стала равной:
			| "Представление транзакции" |
			| "Загрузка из MS Excel"     |
			| "Очистка диапазона ячеек"  |
			| "Загрузка из MS Excel"     |
		И я нажимаю на кнопку с именем 'ФормаОтмена'

	* Записываем
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Применить'
		И я нажимаю на кнопку с именем 'ОбновитьДанныеТаблицы'
				
	* Сверяем результат	
		И я жду открытия формы '$ЗаголовокОкна$' в течение 20 секунд
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2_СТ.mxl'
