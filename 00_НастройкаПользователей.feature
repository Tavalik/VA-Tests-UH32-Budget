﻿#language: ru

@tree

Функционал: 00. Настройка пользователей

	Я хочу настроить права и добавить всех пользователей

Контекст: 

	И я закрыл все окна клиентского приложения	

Сценарий: 00.01 Запуск нужного клиента тестирования

	И я закрываю TestClient "УХ - НСИ"
	И я закрываю TestClient "УХ - Казначейство"
	И я закрываю TestClient "УХ - Закупки"
	И я закрываю TestClient "УХ - Дымовые"

	И Я подключаю клиент тестирования "Этот клиент" из таблицы клиентов тестирования

	И Инициализация переменных

Сценарий: 00.02 Настройка информационной базы

	* Настройка прав доступа
		И В командном интерфейсе я выбираю "Администрирование" "Настройки пользователей и прав"
		Тогда открылось окно "Настройки пользователей и прав"
		И я устанавливаю флаг с именем 'ИспользоватьНесколькоОтветственных'
		И я устанавливаю флаг с именем 'ИспользоватьГруппыПользователей'
		И я устанавливаю флаг с именем 'ОграничиватьДоступНаУровнеЗаписей'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно "Настройки пользователей и прав"
		И из выпадающего списка с именем 'ОграничиватьДоступНаУровнеЗаписейУниверсально' я выбираю точное значение "Стандартный"
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'

	* Настройка даты запрета редактирования
		Тогда открылось окно "Настройки пользователей и прав"
		И я разворачиваю группу с именем 'ГруппаПерсональныеНастройкиПользователей'
		И я разворачиваю группу с именем 'ГруппаДатыЗапретаИзменения'
		И я устанавливаю флаг с именем 'ИспользоватьДатыЗапретаИзменения'
		И я нажимаю на кнопку с именем 'НастроитьДатыЗапретаИзменения'
		Тогда открылось окно "Даты запрета изменения данных"
		И в поле с именем 'ДатаЗапретаПростойРежим' я ввожу текст '31.12.2000'
		И я перехожу к закладке с именем 'ГруппаРасширенныеВозможности'
		И из выпадающего списка с именем 'СпособУказанияДатыЗапрета' я выбираю точное значение "Общая дата"
		И Я закрываю окно "Даты запрета изменения данных"

Сценарий: 00.03 Создание профилей

	И Я создаю профиль с именем "Бюджетирование1" на основании профиля "Работа с настраиваемой отчетностью (экземпляры отчетов, корректировки, сводная таблица)"

	И Я добавляю в профиль "Бюджетирование1" ограничение доступа с видом "Организации" значением "Все запрещены, исключения назначаются в группах доступа"

Сценарий: 00.04 Создание групп доступа

	И Я нахожу или создаю группу доступа с именем "Администраторы" по профилю "Администратор"
	И Я нахожу или создаю группу доступа с именем "Открытие внешних отчетов и обработок" по профилю "Открытие внешних отчетов и обработок"
	И Я нахожу или создаю группу доступа с именем "Бюджетирование1" по профилю "Бюджетирование1"

Сценарий: 00.05 Создание пользователя "Администратор"

	И Я нахожу или создаю пользователя "Администратор" группа доступа "" группа ""

	Когда открылось окно "Администратор (Пользователь)"
	И В текущем окне я нажимаю кнопку командного интерфейса "Права доступа"

	* Группа "Администраторы"
		Если в таблице 'ГруппыДоступа' есть строка Тогда
			| "Наименование"   | "Профиль"        |
			| "Администраторы" | "Администратор"  |
		Иначе
			И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
			Тогда открылось окно "Группы доступа"
			И в таблице 'ГруппыДоступа' я перехожу к строке:
				| "Наименование"   |
				| "Администраторы" |
			И в таблице 'ГруппыДоступа' я выбираю текущую строку
	
	* Группа "Открытие внешних отчетов и обработок"
		Если в таблице 'ГруппыДоступа' есть строка Тогда
			| "Наименование"                         | "Профиль"                              |
			| "Открытие внешних отчетов и обработок" | "Открытие внешних отчетов и обработок" |
		Иначе
			И в таблице 'ГруппыДоступа' я нажимаю на кнопку с именем 'ГруппыДоступаВключитьВГруппу'
			Тогда открылось окно "Группы доступа"
			И в таблице 'ГруппыДоступа' я перехожу к строке:
				| "Наименование"                         |
				| "Открытие внешних отчетов и обработок" |
			И в таблице 'ГруппыДоступа' я выбираю текущую строку
		
Сценарий: 00.06 Создание пользователей для Бюджетирования

	И Я нахожу или создаю группу пользователей с именем "Бюджетирование"

	И Я нахожу или создаю пользователя "Бюджетирование1" группа доступа "Бюджетирование1" группа "Бюджетирование"
	И Я нахожу или создаю пользователя "Бюджетирование2" группа доступа "Бюджетирование1" группа "Бюджетирование"
	И Я нахожу или создаю пользователя "Бюджетирование3" группа доступа "Бюджетирование1" группа "Бюджетирование"
	И Я нахожу или создаю пользователя "Бюджетирование4" группа доступа "Бюджетирование1" группа "Бюджетирование"
