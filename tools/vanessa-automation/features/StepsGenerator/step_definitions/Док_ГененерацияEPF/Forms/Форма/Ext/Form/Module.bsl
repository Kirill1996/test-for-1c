﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;


&НаКлиенте
Перем ТекКолТаймер,МаксКолТаймер;

// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);


	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
	ИмяEPF = Контекст.ИмяEPF;
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяEPF) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяEPF);
	КонецЕсли;	 
	
	
	//вернём в фиче строку как она была раньше
	
	ВременнаяФича = ПолучитьИмяВременногоФайла("feature");
	ЗТ = Новый ЗаписьТекста(ВременнаяФича,"UTF-8",,Ложь); 
	
	ИмяФичи = Ванесса.Объект.КаталогИнструментов + "\Features\Support\Instructions\Core\ДляГенерацииEPF.feature";
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФичи,"UTF-8");
	
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = СтрЗаменить(Стр,"Тогда сумма будет меньше 20","Тогда я получу сумму слагаемых 15");
		ЗТ.ЗаписатьСтроку(Стр); 
	КонецЦикла;	
	
	Текст.Закрыть();
	ЗТ.Закрыть();
	
	Ванесса.УдалитьФайлыКомандаСистемы(ИмяФичи);
	Ванесса.ПереместитьФайлКомандаСистемы(ВременнаяФича,ИмяФичи);
	
	Ванесса.Шаг("И я закрываю конфигуратор служебной базы");
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


