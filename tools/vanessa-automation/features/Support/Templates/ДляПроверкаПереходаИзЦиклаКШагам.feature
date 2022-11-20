# language: ru
# encoding: utf-8
#parent uf:
@UF9_Вспомогательные_фичи
#parent ua:
@UA51_Макеты_для_ТурбоГеркин

@IgnoreOnCIMainBuild
@tree


Функциональность: ДляПроверкаПереходаИзЦиклаКШагам

 



Сценарий: ДляПроверкаПереходаИзЦиклаКШагам
	* Группа 1
		И для каждой строки таблицы я выполняю
				| 'Колонка1'   | 'Колонка2'   | 'Колонка3'   |
				| 'Значение1'  | 'Значение2'  | 'Значение3'  |
				| 'Значение4'  | 'Значение5'  | 'Значение6'  |
				| 'Значение7'  | 'Значение8'  | 'Значение9'  |
				
				Если '$Колонка1$ = "Значение1"' Тогда
					И Я запоминаю значение выражения '1' в переменную "ИмяПеременной"

	* Группа 2
	* Группа 3
		И Я запоминаю значение выражения '2' в переменную "ИмяПеременной"
	
	И я вывожу значение переменной "ИмяПеременной"