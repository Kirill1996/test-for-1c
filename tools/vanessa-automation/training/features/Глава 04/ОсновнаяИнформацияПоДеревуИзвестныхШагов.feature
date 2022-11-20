﻿# language: ru

@lessons

Функционал: Интерактивная справка. Основная информация по дереву известных шагов.

Сценарий: Основная информация по дереву известных шагов

	* Привет! В этом уроке я расскажу тебе про библиотеку доступных шагов. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* Библиотека шагов представляет собой специальный объект, в котором можно удобно найти шаг для выполнения того или иного действия.
	* Он находится тут.
		И Я делаю подсветку элемента формы VA по имени "ГруппаVanessaEditorИнструменты" "Инструменты"
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаVanessaEditorИнструменты'
		И Пауза 1
	* Давай выполним эту команду.
		И Я делаю подсветку элемента VA "VanessaEditorДобавитьИзвестныйШаг" "Библиотека шагов" и перемещаю курсор
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'VanessaEditorДобавитьИзвестныйШаг'
		И Пауза 1

	* Перед нами открылся специальный инструмент, который позволяет работать с текущей библиотекой шагов.
	* Основным элементом является это дерево шагов, которое было построено на основании шагов всех библиотек, которые были загружены Vanessa Automation.	
		И Я делаю подсветку у дерева известных шагов "Дерево известных шагов"

	* Для того чтобы получить информацию о каком-либо шаге нужно раскрыть узлы дерева.
		И я делаю клик по элементу формы 'ЭтотСеанс' 'UI' 'ListItem' UI Automation
		И Пауза 1
		И я нажимаю сочетание клавиш "Right"
		И Пауза 1

		И я делаю клик по элементу формы 'ЭтотСеанс' 'Всплывающие окна' 'ListItem' UI Automation
		И Пауза 1
		И я нажимаю сочетание клавиш "Right"
		И Пауза 1

		И я делаю клик по элементу формы 'ЭтотСеанс' 'И я закрываю окно предупреждения' 'ListItem' UI Automation
		И Пауза 1
		И я нажимаю сочетание клавиш "Right"
		И Пауза 1
		
	* Давай посмотрим какая информация о шаге нам доступна.
	* В первую очередь - это пример, как можно использовать шаг в сценарии.
		И Я делаю подсветку у строки дерева шагов 'И я закрываю окно предупреждения' 'Пример как можно использовать шаг в сценарии'
		
	* Тут находится информация в каком epf файле находится реализация данного шага.
		Если существует элемент UI Automation "ЭтотСеанс" с именем "Файл:" и типом "Text" Тогда
			И я запоминаю строку "Истина" в переменную "ЯзыкРусский"
		Иначе	
			И я запоминаю строку "Ложь" в переменную "ЯзыкРусский"

		Если '$ЯзыкРусский$' Тогда	
			И Я делаю подсветку у поля дерева шагов 'Файл:' 'В каком epf файле находится реализация данного шага'
		Иначе	
			И Я делаю подсветку у поля дерева шагов 'File:' 'В каком epf файле находится реализация данного шага'

	* А тут находится информация о том, какая процедура вызывается в данном epf файле.
		Если '$ЯзыкРусский$' Тогда	
			И Я делаю подсветку у поля дерева шагов 'Имя процедуры:' 'Какая процедура вызывается'
		Иначе	
			И Я делаю подсветку у поля дерева шагов 'Procedure:' 'Какая процедура вызывается'

	* Тут находится описание того как работает данный шаг.
		Если '$ЯзыкРусский$' Тогда	
			И Я делаю подсветку у поля дерева шагов по подсказке 'Описание' 'Описание шага'
		Иначе	
			И Я делаю подсветку у поля дерева шагов по подсказке 'Description' 'Описание шага'

	* Движемся далее. Чтобы быстро найти нужный шаг можно воспользоваться поиском.	
		Если '$ЯзыкРусский$' Тогда	
			И Я делаю подсветку у поля дерева шагов по подсказке 'Поиск' 'Поиск'
		Иначе	
			И Я делаю подсветку у поля дерева шагов по подсказке 'Search' 'Поиск'
		
	* Например, можно найти все шаги, которые являются циклами.
		И Пауза 1
		Если '$ЯзыкРусский$' Тогда	
			И Я делаю клик в поле дерева шагов по подсказке 'Поиск' 
		Иначе	
			И Я делаю клик в поле дерева шагов по подсказке 'Search' 
		И Пауза 1
		И я эмулирую ввод текста "Цикл"
		И Пауза 1
		И я нажимаю сочетание клавиш "Enter"
		И Пауза 1
		
	* При этом в дереве шагов остались только те шаги, которые являются циклами или как-то связаны с циклами.	
		И Я делаю подсветку у дерева известных шагов "Шаги-циклы"
	* Обратите внимание, что шаги циклы выделяются цветом в дереве известных шагов.	

	* Также легко найти шаги, которые всегда выполняются как условия.
		Если '$ЯзыкРусский$' Тогда	
			И Я делаю клик в поле дерева шагов по подсказке 'Поиск' 
		Иначе	
			И Я делаю клик в поле дерева шагов по подсказке 'Search' 
		И Пауза 1
		И я эмулирую ввод текста "Условие"
		И Пауза 1
		И я нажимаю сочетание клавиш "Enter"
		И Пауза 1
	
	* При этом в дереве шагов остались только те шаги, которые всегда выполняются как условие.	
		И Я делаю подсветку у дерева известных шагов "Шаги-условия"
		
	* На этом всё, переходи к следующему уроку интерактивной справки.



