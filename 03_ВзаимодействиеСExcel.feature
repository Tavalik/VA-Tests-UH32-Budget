﻿#language: ru

@tree

Функционал: 03. Выгрузука бланков и загрузка экземпляров отчетов из Excel

Как Администратор я хочу 
проверить что выгрузка и загрузка из Excel работы 
чтобы загружать экземпляры отчетов из файлов

Контекст: 

	И я подключаю TestClient 'УХ - Бюджетирование' логин "Администратор" пароль ''
	И я закрыл все окна клиентского приложения

Сценарий: 03.00 Определение типа приложения

	Пусть Инициализация переменных

Сценарий: 03.01 Создание внешней информационной базы

	И Я создаю внешнюю информационную базу с именем 'ВА - Импорт из Excel' и типом "Файлы Microsoft Excel"

Сценарий: 03.02 Создание отчета с группами и 6 аналитиками

	И Я создаю вид отчета с именем 'ВА - ИмпортExcel' и родителем 'ВА - Группа отчетов'
	
	* Создаем строки отчета
		И Я открываю контруктор отчета с именем 'ВА - ИмпортExcel'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Синтетика_1'
		И Я в конструкторе отчета добавляю строку с именем 'Группа_Синтетика'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Синтетика_2'
		И Я в конструкторе отчета добавляю строку с именем 'Группа_Аналитики_0'
		И Я в конструкторе отчета добавляю строку с именем 'Группа_Аналитики_1_2'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Аналитики_1'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Аналитики_2'
		И Я в конструкторе отчета добавляю строку с именем 'Группа_Аналитики_6'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Аналитики_6'
		И Я в конструкторе отчета добавляю строку с именем 'Группа_Валюта'
		И Я в конструкторе отчета добавляю строку с именем 'Строка_Аналитики_6_Валюта'

	* Задаем иерархию строк
		И Я в конструкторе отчета в ячейке 'R6C1' я меняю родителя у строки на 'Группа_Аналитики_0'
		И Я в конструкторе отчета в ячейке 'R9C1' я меняю родителя у строки на 'Группа_Аналитики_0'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Группа_Валюта'
		И Я в конструкторе отчета в ячейке 'R11C1' я меняю родителя у строки на 'Группа_Аналитики_6'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Группа_Аналитики_6'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Группа_Аналитики_1_2'
		И Я в конструкторе отчета в ячейке 'R12C1' я меняю родителя у строки на 'Группа_Аналитики_1_2'
		И Я в конструкторе отчета в ячейке 'R4C1' я меняю родителя у строки на 'Группа_Синтетика'
	
	* Создаем колонки отчета
		И Я в конструкторе отчета добавляю колонку с именем 'Количество'
		И Я в конструкторе отчета добавляю колонку с именем 'Сумма'

	* Вводим аналитики
		* Аналитика 'Контрагенты'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0Контраг' в ячейку 'R7C2' 	
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
		* Аналитика 'Договоры контрагентов'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0ДогКонт' в ячейку 'R8C3'
			Тогда открылось окно "Конструктор отчета"
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R10C3'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C3'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика 'Товарные категории'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0ТовКате' в ячейку 'R10C4'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C4'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика 'Номенклатура'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0Номенкл' в ячейку 'R10C5'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C5'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика 'Статьи ДДС'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0СтатДДС' в ячейку 'R10C6'
			И я нажимаю на кнопку с именем 'СкопироватьАналитику'
			И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R12C6'
			И я нажимаю на кнопку с именем 'ВставитьАналитику'
		* Аналитика 'Статьи доходов и расходов'
			И Я в конструкторе отчета добавляю аналитику с кодом 'ВА0СДохРас' в ячейку 'R10C7'
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
			| 'Строка_Синтетика_1'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Группа_Синтетика'          | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Строка_Синтетика_2'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Группа_Аналитики_0'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Группа_Аналитики_1_2'      | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Строка_Аналитики_1'        | 'Контрагенты' | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Строка_Аналитики_2'        | 'Контрагенты' | 'Договоры контрагентов' | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Группа_Аналитики_6'        | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Строка_Аналитики_6'        | 'Контрагенты' | 'Договоры контрагентов' | 'Товарные категории' | 'Номенклатура' | 'Статьи ДДС'  | 'Статьи доходов и расходов' | ''                     | ''          |
			| 'Группа_Валюта'             | ''            | ''                      | ''                   | ''             | ''            | ''                          | ''                     | ''          |
			| 'Строка_Аналитики_6_Валюта' | 'Контрагенты' | 'Договоры контрагентов' | 'Товарные категории' | 'Номенклатура' | 'Статьи ДДС'  | 'Статьи доходов и расходов' | '■'                    | ''          |

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

Сценарий: 03.03 Создание многопериодного бланка отчета и выгузка в Excel

	* Найдем вид отчета
		И Я нахожу в списке вид отчета с именем 'ВА - ИмпортExcel'
		Тогда открылось окно "Виды и бланки отчетов"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"     |
			| 'ВА - ИмпортExcel' |
		И в таблице 'Список' я активизирую поле с именем 'Наименование'
		И в таблице 'Список' я выбираю текущую строку

	* Создаем бланк
		Тогда Открылся бланк для вида отчета 'ВА - ИмпортExcel'
		И я запоминаю текущее окно как 'ЗаголовокОкна'
		И я нажимаю на кнопку с именем 'ПоказатьПанельПоказателей'
		И из выпадающего списка с именем 'БланкДляОтображения' я выбираю точное значение "Для импорта и отображения"
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Структура отчета"
		И из выпадающего списка с именем 'ШаблонОформленияБланковОтчетов' я выбираю по строке "Классический"
		И я снимаю флаг с именем 'ВыводитьРеквизиты'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'

	* Настраиваем сортировку
		Когда открылось окно '$ЗаголовокОкна$ *'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R18C1'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Настройка области аналитического раскрытия"
		И я перехожу к закладке с именем 'РазделСортировка'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я перехожу к строке:
			| "Поле"                      |
			| 'Номенклатура.Наименование' |
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' из выпадающего списка с именем 'КомпоновщикНастроекНастройкиПорядокПоле' я выбираю точное значение 'Номенклатура.Артикул'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Применить'
		Когда открылось окно '$ЗаголовокОкна$ *'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке 'R21C1'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Настройка области аналитического раскрытия"
		И я перехожу к закладке с именем 'РазделСортировка'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я перехожу к строке:
			| "Поле"                      |
			| 'Номенклатура.Наименование' |
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' из выпадающего списка с именем 'КомпоновщикНастроекНастройкиПорядокПоле' я выбираю точное значение 'Номенклатура.Артикул'
		И в таблице 'КомпоновщикНастроекНастройкиПорядок' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'Применить'

	* Записываем бланк
		Тогда открылось окно '$ЗаголовокОкна$ *'
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'

	* Сохраняем бланк
		Тогда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Экспортировать'
		Тогда открылось окно "Сохранение макета отчета"
		И из выпадающего списка с именем 'ВнешняяИБ' я выбираю по строке 'ВА - Импорт из Excel'
		И в поле с именем 'ИмяФайлаВыгрузки' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
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
		И в поле с именем 'ПутьКДокументу1' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.xlsx'
		И в поле с именем 'ПутьКДокументу2' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Шаблон.mxl'
		И я устанавливаю флаг с именем 'СравниватьТолькоЗначения'
		И я устанавливаю флаг с именем 'СравниватьПоШаблону'								
		И я нажимаю на кнопку с именем 'ФормаСравнитьДокументы'
		Тогда открылось окно "Документы идентичны: Сравнение табличных документов"
		И Я закрываю окно "Документы идентичны: Сравнение табличных документов"

Сценарий: 03.04 Создание экземпляра отчета - 'ВА - ИмпортExcel'	и загрузка из файла

	И Я создаю экземпляр отчета для вида отчета 'ВА - ИмпортExcel' сценарий 'ВА - Основной сценарий' период '01.01.2021' '31.03.2021' периодичность "Месяц" организация 'Меркурий ООО' проект '' аналитики '' '' '' '' '' '' 
	И я запоминаю текущее окно как 'ЗаголовокОкна'
		
	* Документ должен быть пуст
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| 'ВА - ИмпортExcel'          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | ''               | ''      | ''                | ''      | ''             | ''      |
			| ''                          | 'Контрагенты_Наименование' | 'Договоры контрагентов_Наименование' | 'Товарные категории_Наименование' | 'Номенклатура_Наименование' | 'Статьи ДДС_Наименование' | 'Статьи доходов и расходов_Наименование' | 'Валюты_Наименование' | 'Январь 2021 г.' | ''      | 'Февраль 2021 г.' | ''      | 'Март 2021 г.' | ''      |
			| ''                          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | 'Количество'     | 'Сумма' | 'Количество'      | 'Сумма' | 'Количество'   | 'Сумма' |
			| 'Строка_Синтетика_1'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Группа_Синтетика'          | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Строка_Синтетика_2'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Группа_Аналитики_0'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Группа_Аналитики_1_2'      | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Строка_Аналитики_1'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Строка_Аналитики_2'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Группа_Аналитики_6'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Строка_Аналитики_6'        | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Группа_Валюта'             | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |
			| 'Строка_Аналитики_6_Валюта' | ''                         | ''                                   | ''                                | ''                          | ''                        | ''                                       | ''                    | '0'              | '0'     | '0'               | '0'     | '0'            | '0'     |

	* Загружаем из шаблона
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
		Тогда открылось окно "Выбор способа заполнения"
		И я перехожу к закладке с именем 'ГруппаСтраницаИмпортИзФайла'
		Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
			И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий.xlsx'
		Если '$$ЯзыкИнтерфейса$$ = "En"' Тогда
			И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En.xlsx'
		Тогда открылось окно "Выбор способа заполнения"
		И я нажимаю на кнопку с именем 'ЗаполнитьОтчет'
		Тогда открылось окно '$ЗаголовокОкна$'
		Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'	
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: 03.05 Повторная загрузка данных из файла

	И Я открываю первый экземпляр отчета для вида отчета 'ВА - ИмпортExcel'
	Тогда Открылся экземпляр отчета для вида отчета 'ВА - ИмпортExcel' валюта 'RUB' организация 'Меркурий ООО' сценарий 'ВА - Основной сценарий' периодичность "Месяц" проект '' аналитики '' '' '' '' '' '' 
	И я запоминаю текущее окно как 'ЗаголовокОкна'
	
	И я нажимаю на кнопку с именем 'РазрешитьРедактирование'
	И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
	Тогда открылось окно "Выбор способа заполнения"
	И я перехожу к закладке с именем 'ГруппаСтраницаИмпортИзФайла'
	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_2.xlsx'
	Если '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_2_En.xlsx'	
	Тогда открылось окно "Выбор способа заполнения"
	И я нажимаю на кнопку с именем 'ЗаполнитьОтчет'
	Тогда открылось окно '$ЗаголовокОкна$ *'
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий_2.mxl'	
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$ *' в течение 20 секунд

	Тогда открылось окно "Экземпляры отчетов"
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно '$ЗаголовокОкна$'
	И я нажимаю на кнопку с именем 'РазрешитьРедактирование'
	И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
	Тогда открылось окно "Выбор способа заполнения"
	И я перехожу к закладке с именем 'ГруппаСтраницаИмпортИзФайла'
	Если '$$ЯзыкИнтерфейса$$ = "Ru"' Тогда
		И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий.xlsx'
	Если '$$ЯзыкИнтерфейса$$ = "En"' Тогда
		И в поле с именем 'ПутьКФайлу' я ввожу текст '$КаталогПроекта$\Макеты\ВА_ИмпортExcel_Меркурий_En.xlsx'	
	Тогда открылось окно "Выбор способа заполнения"
	И я нажимаю на кнопку с именем 'ЗаполнитьОтчет'
	Тогда открылось окно '$ЗаголовокОкна$ *'
	Дано Табличный документ 'ПолеТабличногоДокументаМакет' равен макету '\\Макеты\ВА_ИмпортExcel_Меркурий.mxl'	
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$ *' в течение 20 секунд
		