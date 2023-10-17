﻿#language: ru
@tree

Функционал: 15. Проверка контролируемых значений при записи

	Как Администратор я хочу
	чтобы нельзя было записать значение показателя большее, чем контрольное

Контекст: 

	И я закрыл все окна клиентского приложения

Сценарий: 15.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 15.01 Создание вида отчета "ВА - Контролируемые показатели"

	* Создает вид отыета
		И Я создаю вид отчета с именем "ВА - Контролируемые показатели" и родителем "ВА - Группа отчетов"
		И Я открываю вид отчета с именем "ВА - Контролируемые показатели"
	
	* Доработаем вид отчета	
		И я изменяю флаг с именем 'СохранятьИсториюИзменений'
		И я устанавливаю флаг с именем 'РазделениеПоПроектам'		
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'

	* Настраиваем структуру вида отчета
		И я нажимаю на кнопку с именем 'РедактироватьДерево'
		Когда открылось окно "Конструктор отчета"
		И Я в конструкторе отчета добавляю строку с именем "Синтетика"
		И Я в конструкторе отчета добавляю строку с именем "Аналитики"
		И Я в конструкторе отчета добавляю колонку с именем "Количество"
		И Я в конструкторе отчета добавляю колонку с именем "КонтрольДа"
		И Я в конструкторе отчета добавляю колонку с именем "КонтрольНет"
		И Я в конструкторе отчета добавляю колонку с именем "Дата"

	* Настраиваем показатели
		И Я в конструкторе отчета в ячейке 'R2C2:R3C5' меняю свойства показателей 'КонтролируемыйПоказатель' на "Истина"	
		И Я в конструкторе отчета в ячейке 'R2C2' меняю свойства показателей 'КонтролируемыйПоказатель' на "Ложь"
		И я в конструкторе отчета в ячейке 'R3C2' меняю свойство показателя 'КонтролируемыйПоказатель' на "Ложь"
		И я в конструкторе отчета в ячейке 'R2C5' меняю свойство показателя 'ТипЗначения' на "Дата"
		И я в конструкторе отчета в ячейке 'R3C5' меняю свойство показателя 'ТипЗначения' на "Дата"

	* Настраиваем аналитики
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0СтатДДС" в ячейку 'R3C2'
		И Я в конструкторе отчета добавляю аналитику с кодом "ВА0Номенкл" в ячейку 'R3C3'
		И Я в конструкторе отчета в ячейке 'R3C8' меняю аналитику валюта
		И Я в конструкторе отчета в ячейке 'R3C2:R3C5' меняю свойства показателей 'ПересчитыватьВалютнуюСумму' на "Истина"

	* Бланк вида отчета
		И Я Для вида отчета "ВА - Контролируемые показатели" создаю бланк по умолчанию		

	* Создаем бланк сводной таблицы
		И Я для вида отчета "ВА - Контролируемые показатели" создаю бланк сводной таблицы по умолчанию с отборами "Проект"
		Когда открылось окно "ВА - Контролируемые показатели (Виды отчетов)"
		И я нажимаю на кнопку открытия поля с именем 'БланкСводнойТаблицыПоУмолчанию'
		Тогда Открылся бланк сводной таблицы для вида отчета "ВА - Контролируемые показатели"
		И я нажимаю на кнопку с именем 'ПоказатьНастройкиТаблицыПоОсям'
		Тогда открылось окно "Настройка расположения полей"
		И в таблице 'ТаблицаСтроки' я перехожу к строке:
			| "По горизонтали (в строках)" |
			| "Номенклатура"               |
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И в таблице 'ТаблицаСтроки' я перехожу к строке:
			| "По горизонтали (в строках)" |
			| "Дополнительные валюты"      |
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я нажимаю на кнопку с именем 'СтрокиПереместитьВниз'
		И я изменяю флаг с именем 'ИтогПоКолонокам'
		И я нажимаю на кнопку с именем 'КнопкаПрименить'
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

Сценарий: 15.02 Создание нового сценария для контролируемых значений

	И Я создаю сценарий с именем "ВА - Сценарий с контролем"
	И Я для сценария "ВА - Сценарий с контролем" на закладке 'Бюджетирование' для реквизита 'КонтролирующийСценарий' устанавливаю значение "ВА - Основной сценарий"

	И Я создаю документ управления периодом со сценарием "ВА - Сценарий с контролем" регламентом "ВА - Основной регламент" периодичностью "Месяц" датой начала '01.01.2024' датой окончания '31.03.2024'

Сценарий: 15.03 Настройка прав для пользователя "Бюджетирование1"

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Контролируемые показатели" пользователя "Бюджетирование1" по всем организациям
	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование1" пароль ''

Сценарий: 15.04 Создание экземпляра отчета "ВА - Контролируемые показатели"

	И Я создаю экземпляр отчета для вида отчета "ВА - Контролируемые показатели" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект "ВА - Основной проект" аналитики '' '' '' '' '' ''

	* Вводим значения показателей
		* Синтетика
			И Я ввожу значение '100' в ячейку 'R6C2'
			И Я ввожу значение '100' в ячейку 'R6C3'
			И Я ввожу значение '100' в ячейку 'R6C4'
			И Я ввожу значение '01.01.2024' в ячейку 'R6C5'
			И Я ввожу значение '200' в ячейку 'R6C6'
			И Я ввожу значение '200' в ячейку 'R6C7'
			И Я ввожу значение '200' в ячейку 'R6C8'
			И Я ввожу значение '01.01.2024' в ячейку 'R6C9'
		* Аналитики
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C14'
				| "Статьи ДДС"                       | "Номенклатура"                 | "Валюты" | 'Период_1_Значение1' | 'Период_2_Значение1' |
				| "Реализация программных продуктов" | "1С:Управление холдингом 8"    | 'RUB'    | '100'                | '200'                |
				| "Реализация программных продуктов" | "1С:Корпорация"                | 'RUB'    | '100'                | '200'                |
				| "Реализация программных продуктов" | "1С:ERP. Управление холдингом" | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C15'
				| "Статьи ДДС"                       | "Номенклатура"                 | "Валюты" | 'Период_1_Значение1' | 'Период_2_Значение1' |
				| "Реализация программных продуктов" | "1С:Управление холдингом 8"    | 'RUB'    | '100'                | '200'                |
				| "Реализация программных продуктов" | "1С:Корпорация"                | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C16'
				| "Статьи ДДС"                       | "Номенклатура"                 | "Валюты" | 'Период_1_Значение1' | 'Период_2_Значение1' |
				| "Реализация программных продуктов" | "1С:Управление холдингом 8"    | 'RUB'    | '100'                | '200'                |
				| "Реализация программных продуктов" | "1С:Корпорация"                | 'RUB'    | '100'                | '200'                |
			И Я добавляю значения с раскрытием показателей в ячейку 'R7C17'
				| "Статьи ДДС"                       | "Номенклатура"                 | "Валюты" | 'Период_1_Значение1' | 'Период_2_Значение1' |
				| "Реализация программных продуктов" | "1С:Управление холдингом 8"    | 'RUB'    | '01.01.2024'         | '01.02.2024'         |
				| "Реализация программных продуктов" | "1С:Корпорация"                | 'RUB'    | '01.01.2024'         | '01.02.2024'         |
				| "Реализация программных продуктов" | "1С:ERP. Управление холдингом" | 'RUB'    | '01.01.2024'         | '01.02.2024'         |

	* Записываем, проверяем форму
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Записать'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Контролируемые показатели"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "Январь 2024 г." | ''           | ''            | ''           | "Февраль 2024 г." | ''           | ''            | ''           | "Март 2024 г." | ''           | ''            | ''     | "ИТОГО"      | ''           | ''            | ''           |
			| ''                                  | "Количество"     | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"      | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"   | "КонтрольДа" | "КонтрольНет" | "Дата" | "Количество" | "КонтрольДа" | "КонтрольНет" | "Дата"       |
			| "Синтетика"                         | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.01.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.01.2024' |
			| "Аналитики"                         | '300'            | '200'        | '200'         | '01.01.2024' | '600'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '900'        | '600'        | '600'         | '01.02.2024' |
			| "Реализация программных продуктов " | '300'            | '200'        | '200'         | '01.01.2024' | '600'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '900'        | '600'        | '600'         | '01.02.2024' |
			| "1С:ERP. Управление холдингом "     | '100'            | '0'          | '0'           | '01.01.2024' | '200'             | '0'          | '0'           | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '0'          | '0'           | '01.02.2024' |
			| 'RUB '                              | '100'            | '0'          | '0'           | '01.01.2024' | '200'             | '0'          | '0'           | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '0'          | '0'           | '01.02.2024' |
			| "1С:Корпорация "                    | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| "1С:Управление холдингом 8 "        | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |

	* Удаляем одну строку
		Когда открылось окно '$ЗаголовокОкна$'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R7C14"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Раскрытие показателей: *"
		И в таблице 'РаскрытиеПоказателей' я перехожу к строке:
			| "Валюты" | 'Значение1' | 'ЗначениеВалюта1' | "Номенклатура"                 | 'Период отчета'   | "Статьи ДДС"                       |
			| 'RUB'    | '200'       | '200'             | "1С:ERP. Управление холдингом" | "Февраль 2024 г." | "Реализация программных продуктов" |
		И в таблице 'РаскрытиеПоказателей' я нажимаю на кнопку с именем 'РаскрытиеПоказателейУдалить'
		И в таблице 'РаскрытиеПоказателей' я перехожу к строке:
			| "Валюты" | 'Значение1' | 'ЗначениеВалюта1' | "Номенклатура"                 | 'Период отчета'  | "Статьи ДДС"                       |
			| 'RUB'    | '100'       | '100'             | "1С:ERP. Управление холдингом" | "Январь 2024 г." | "Реализация программных продуктов" |
		И в таблице 'РаскрытиеПоказателей' я нажимаю на кнопку с именем 'РаскрытиеПоказателейУдалить'
		И я нажимаю на кнопку с именем 'ФормаКнопкаОК'
		Когда открылось окно '$ЗаголовокОкна$'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R7C17"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно "Раскрытие показателей: *"
		И в таблице 'РаскрытиеПоказателей' я перехожу к строке:
			| "Валюты" | 'Значение1'  | "Номенклатура"                 | 'Период отчета'   | "Статьи ДДС"                       |
			| 'RUB'    | '01.02.2024' | "1С:ERP. Управление холдингом" | "Февраль 2024 г." | "Реализация программных продуктов" |
		И в таблице 'РаскрытиеПоказателей' я нажимаю на кнопку с именем 'РаскрытиеПоказателейУдалить'
		И в таблице 'РаскрытиеПоказателей' я перехожу к строке:
			| "Валюты" | 'Значение1'  | "Номенклатура"                 | 'Период отчета'  | "Статьи ДДС"                       |
			| 'RUB'    | '01.01.2024' | "1С:ERP. Управление холдингом" | "Январь 2024 г." | "Реализация программных продуктов" |
		И в таблице 'РаскрытиеПоказателей' я нажимаю на кнопку с именем 'РаскрытиеПоказателейУдалить'
		И я нажимаю на кнопку с именем 'ФормаКнопкаОК'

	* Проверяем движение документа	
		Когда открылось окно '$ЗаголовокОкна$'		
		И я нажимаю на кнопку с именем 'ФормаОткрытьДвиженияДокументаПлоскаяТаблица'
		Тогда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Плоская таблица значений показателей"
		И я жду когда в табличном документе 'ОтчетТабличныйДокумент' заполнится ячейка 'R2C1' в течение 30 секунд
		Когда Я задаю параметры чтения области макета 'R1C1:R200C20'
		Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "Макеты\15\ВА_КонтролируемыеПоказатели_Движения.mxl" по шаблону	
		И Я закрываю окно "Плоская таблица значений показателей"

	* Обновляем и проверяем форму
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'ФормаОбновитьСУчетомВерсий'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Контролируемые показатели"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "Январь 2024 г." | ''           | ''            | ''           | "Февраль 2024 г." | ''           | ''            | ''           | "Март 2024 г." | ''           | ''            | ''     | "ИТОГО"      | ''           | ''            | ''           |
			| ''                                  | "Количество"     | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"      | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"   | "КонтрольДа" | "КонтрольНет" | "Дата" | "Количество" | "КонтрольДа" | "КонтрольНет" | "Дата"       |
			| "Синтетика"                         | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.01.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.01.2024' |
			| "Аналитики"                         | '200'            | '200'        | '200'         | '01.01.2024' | '400'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '01.02.2024' |
			| "Реализация программных продуктов " | '200'            | '200'        | '200'         | '01.01.2024' | '400'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '01.02.2024' |
			| "1С:Корпорация "                    | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| "1С:Управление холдингом 8 "        | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |

Сценарий: 15.05 Создаем экземпляра отчета для контролируемых значений

	* Копируем существующий документ
		И Я нахожу в списке вид отчета с именем "ВА - Контролируемые показатели"
		И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
		Тогда открылось окно "Экземпляры отчетов"
		И я нажимаю на кнопку с именем 'ФормаСкопировать'
		Когда открылось окно "Укажите ключевые реквизиты документа"
		И из выпадающего списка с именем 'Сценарий' я выбираю по строке "ВА - Сценарий с контролем"
		И я нажимаю кнопку выбора у поля с именем 'Организация'
		И Я выбираю организацию "Меркурий ООО"
		Когда открылось окно "Укажите ключевые реквизиты документа"
		И я нажимаю на кнопку с именем 'КнопкаОК'
		Тогда Открылся экземпляр отчета для вида отчета "ВА - Контролируемые показатели" валюта 'RUB' организация "Меркурий ООО" сценарий "ВА - Сценарий с контролем" периодичность "Месяц" проект "ВА - Основной проект" аналитики '' '' '' '' '' '' 
		
	* Меняем значения
		И Я ввожу значение '250' в ячейку 'R6C6'
		И Я ввожу значение '250' в ячейку 'R6C7'
		И Я ввожу значение '150' в ячейку 'R6C8'
		И Я ввожу значение '250' в ячейку 'R10C6'
		И Я ввожу значение '250' в ячейку 'R10C7'
		И Я ввожу значение '150' в ячейку 'R10C8'
		И Я ввожу значение '250' в ячейку 'R6C10'
		И Я ввожу значение '250' в ячейку 'R6C11'
		И Я ввожу значение '150' в ячейку 'R6C12'
		И Я ввожу значение '250' в ячейку 'R10C10'
		И Я ввожу значение '250' в ячейку 'R10C11'
		И Я ввожу значение '150' в ячейку 'R10C12'					

	* Пробуем записать документ
		Когда открылось окно '$ЗаголовокОкна$'
		И я нажимаю на кнопку с именем 'Записать'
		Когда открылось окно "1С:Предприятие"
		И я нажимаю на кнопку с именем 'OK'			
		Когда открылось окно '$ЗаголовокОкна$'
		Тогда в логе сообщений TestClient есть строки:
			|"Превышено контролируемое значение для показателя:\n	Показатель: \"Синтетика контрольда\"\n	Расчетное значение: \"250\"\n	Контрольное значение: \"200\"\n	Контролирующий сценарий: \"ВА - Основной сценарий\"\n	Организация: \"Меркурий ООО\"\n	Период: \"Февраль 2024 г.\"\n	Проект: \"ВА - Основной проект\""|
			|"Превышено контролируемое значение для показателя:\n	Показатель: \"Аналитики контрольда\"\n	Расчетное значение: \"250\"\n	Контрольное значение: \"200\"\n	Контролирующий сценарий: \"ВА - Основной сценарий\"\n	Организация: \"Меркурий ООО\"\n	Период: \"Февраль 2024 г.\"\n	Проект: \"ВА - Основной проект\"\n	Аналитика1: \"Реализация программных продуктов\"\n	Аналитика2: \"1С:Корпорация\"\n	АналитикаВалюта: \"RUB\""|

	* Отменяем изменения
		Когда открылось окно '$ЗаголовокОкна$'
		И я делаю 12 раз		
			И я нажимаю на кнопку с именем 'ОтменитьДействие'
		Тогда табличный документ 'ПолеТабличногоДокументаМакет' равен:
			| "ВА - Контролируемые показатели"    | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | ''               | ''           | ''            | ''           | ''                | ''           | ''            | ''           | ''             | ''           | ''            | ''     | ''           | ''           | ''            | ''           |
			| ''                                  | "Январь 2024 г." | ''           | ''            | ''           | "Февраль 2024 г." | ''           | ''            | ''           | "Март 2024 г." | ''           | ''            | ''     | "ИТОГО"      | ''           | ''            | ''           |
			| ''                                  | "Количество"     | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"      | "КонтрольДа" | "КонтрольНет" | "Дата"       | "Количество"   | "КонтрольДа" | "КонтрольНет" | "Дата" | "Количество" | "КонтрольДа" | "КонтрольНет" | "Дата"       |
			| "Синтетика"                         | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.01.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.01.2024' |
			| "Аналитики"                         | '200'            | '200'        | '200'         | '01.01.2024' | '400'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '01.02.2024' |
			| "Реализация программных продуктов " | '200'            | '200'        | '200'         | '01.01.2024' | '400'             | '400'        | '400'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '600'        | '600'        | '600'         | '01.02.2024' |
			| "1С:Корпорация "                    | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| "1С:Управление холдингом 8 "        | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |
			| 'RUB '                              | '100'            | '100'        | '100'         | '01.01.2024' | '200'             | '200'        | '200'         | '01.02.2024' | '0'            | '0'          | '0'           | ''     | '300'        | '300'        | '300'         | '01.02.2024' |

	* Записываем документ
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд				

Сценарий: 15.06 Создаем сводную таблицу для контролируемых значений 						

	* Открываем сводную таблицу
		И Я октрываю сводную таблицу отчета с именем "ВА - Контролируемые показатели"
		И Я устанавливаю отборы сводной таблицы: дата начала '01.01.2024', дата конца '31.03.2024', валюта 'RUB', сценарий "ВА - Сценарий с контролем", организация "Меркурий ООО"		
		И Я устанавливаю отбор сводной таблицы 'Проект' со значением "ВА - Основной проект"	

	* Вводим значения
		И Я ввожу значение '250' в ячейку 'R4C6'
		И Я ввожу значение '250' в ячейку 'R4C7'
		И Я ввожу значение '150' в ячейку 'R4C8'
		И Я ввожу значение '250' в ячейку 'R8C6'
		И Я ввожу значение '250' в ячейку 'R8C7'
		И Я ввожу значение '150' в ячейку 'R8C8'
		И Я ввожу значение '250' в ячейку 'R4C10'
		И Я ввожу значение '250' в ячейку 'R4C11'
		И Я ввожу значение '150' в ячейку 'R4C12'
		И Я ввожу значение '250' в ячейку 'R8C10'
		И Я ввожу значение '250' в ячейку 'R8C11'
		И Я ввожу значение '150' в ячейку 'R8C12'			

	* Записываем показатели
		И я нажимаю на кнопку с именем 'Применить'
		Тогда открылось окно "Протокол"
		Тогда табличный документ 'ПолеТабличногоДокумента' равен:
			| "Ошибки"                                                                                                                                                                                                                                                                                                                                                                                                                      |
			| "Превышено контролируемое значение для показателя:\n	Показатель: \"Синтетика контрольда\"\n	Расчетное значение: \"250\"\n	Контрольное значение: \"200\"\n	Контролирующий сценарий: \"ВА - Основной сценарий\"\n	Организация: \"Меркурий ООО\"\n	Период: \"Февраль 2024 г.\"\n	Проект: \"ВА - Основной проект\""                                                                                                               |
			| "Превышено контролируемое значение для показателя:\n	Показатель: \"Аналитики контрольда\"\n	Расчетное значение: \"250\"\n	Контрольное значение: \"200\"\n	Контролирующий сценарий: \"ВА - Основной сценарий\"\n	Организация: \"Меркурий ООО\"\n	Период: \"Февраль 2024 г.\"\n	Проект: \"ВА - Основной проект\"\n	Аналитика1: \"Реализация программных продуктов\"\n	Аналитика2: \"1С:Корпорация\"\n	АналитикаВалюта: \"RUB\"" |
				
		