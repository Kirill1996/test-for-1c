﻿Функция ПолучитьИмяПараметра(ТаблицаЗначенийИзФайла,СтрокаИзФайла,СчетчикСтрок,ПозицияВСтроке)
	Стр = "";
	
	КолСимволов = СтрДлина(СтрокаИзФайла);
	Пока Истина Цикл
		ПозицияВСтроке = ПозицияВСтроке + 1;
		Если ПозицияВСтроке > КолСимволов Тогда
			Прервать;
		КонецЕсли;	 
		Символ = Сред(СтрокаИзФайла,ПозицияВСтроке,1);
		
		Если Символ = """" Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = Стр + Символ;
	КонецЦикла;
	
	Возврат Стр;
КонецФункции	

Функция ПрочитатьСтруктуруИзJSON(ТаблицаЗначенийИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат)
	СтруктураДляЗаполнения = Новый Структура;
	
	Пока Истина Цикл
		ПозицияВСтроке = 0;
		СчетчикСтрок = СчетчикСтрок + 1;
		Если СчетчикСтрок > (ТаблицаЗначенийИзФайла.Количество()-1) Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = ТаблицаЗначенийИзФайла[СчетчикСтрок].Стр;
		Если Лев(Стр,1) = "}" Тогда
			Прервать;
		КонецЕсли;	 
		
		ОбработатьСтроку(ТаблицаЗначенийИзФайла,ТаблицаЗначенийИзФайла[СчетчикСтрок].Стр,СчетчикСтрок,ПозицияВСтроке,Результат,СтруктураДляЗаполнения);
		
	КонецЦикла;
	
	
	Возврат СтруктураДляЗаполнения;
КонецФункции	

Функция ПрочитатьМассивИзJSON(ТаблицаЗначенийИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат)
	СтруктураДляЗаполнения = Новый Массив;
	
	Пока Истина Цикл
		ПозицияВСтроке = 0;
		СчетчикСтрок = СчетчикСтрок + 1;
		Если СчетчикСтрок > (ТаблицаЗначенийИзФайла.Количество()-1) Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = ТаблицаЗначенийИзФайла[СчетчикСтрок].Стр;
		Если Лев(Стр,1) = "]" Тогда
			Прервать;
		КонецЕсли;	 
		
		Если Прав(Стр,1) = "," Тогда
			Стр = Лев(Стр,СтрДлина(Стр)-1);
		КонецЕсли;	 
		
		Если Лев(Стр,1) = "{" Тогда
			Значение = ПрочитатьСтруктуруИзJSON(ТаблицаЗначенийИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат);
			СтруктураДляЗаполнения.Добавить(Значение);
			Продолжить;
		КонецЕсли;	 
		
		
		Стр = УбратьЛишниеКавычки(Стр);
		СтруктураДляЗаполнения.Добавить(Стр);
		
	КонецЦикла;
	
	
	Возврат СтруктураДляЗаполнения;
КонецФункции	

Функция ПолучитьЗначениеИзJSON(ТаблицаЗначенийИзФайла,СтрокаИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат)
	Значение = "";
	
	КолСимволов = СтрДлина(СтрокаИзФайла);
	
	//пропускаем проблелы
	Пока Истина Цикл
		ПозицияВСтроке = ПозицияВСтроке + 1;
		Если ПозицияВСтроке > КолСимволов Тогда
			Прервать;
		КонецЕсли;	 
		Символ = Сред(СтрокаИзФайла,ПозицияВСтроке,1);
		
		Если Символ = " " Тогда
			Продолжить;
		Иначе
			Прервать;
		КонецЕсли;	 
		
		
	КонецЦикла;
	
	
	//сейчас мы на первом не пустом символе
	ПозицияВСтроке = ПозицияВСтроке - 1;
	Пока Истина Цикл
		ПозицияВСтроке = ПозицияВСтроке + 1;
		Если ПозицияВСтроке > КолСимволов Тогда
			Прервать;
		КонецЕсли;	 
		Символ = Сред(СтрокаИзФайла,ПозицияВСтроке,1);
		
		
		Если Символ = "{" Тогда
			Значение = ПрочитатьСтруктуруИзJSON(ТаблицаЗначенийИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат);
			Прервать;
		КонецЕсли;	 
		
		Если Символ = "[" Тогда
			Значение = ПрочитатьМассивИзJSON(ТаблицаЗначенийИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат);
			Прервать;
		КонецЕсли;	 
		
		
		Если ПозицияВСтроке = КолСимволов Тогда // значит это последний символ в строке
			Если Символ = "," Тогда
				Продолжить;
			КонецЕсли;	 
		КонецЕсли;	 
		
		
		Значение = Значение + Символ;
		
	КонецЦикла;
	
	
	
	Значение = УбратьЛишниеКавычки(Значение);
	
	Возврат Значение;
	
КонецФункции

Функция УбратьЛишниеКавычки(Знач Значение)

	Если (Лев(Значение,1) = """") и (Прав(Значение,1) = """") Тогда
		Значение = Сред(Значение,2,СтрДлина(Значение)-2);
	КонецЕсли;	 
	
	Возврат Значение;
КонецФункции

Процедура ОбработатьСтроку(ТаблицаЗначенийИзФайла,СтрокаИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат,СтруктураДляЗаполнения)
	КолСимволов = СтрДлина(СтрокаИзФайла);
	Пока Истина Цикл
		ПозицияВСтроке = ПозицияВСтроке+1;
		Если ПозицияВСтроке > КолСимволов Тогда
			Прервать;
		КонецЕсли;	 
		Символ = Сред(СтрокаИзФайла,ПозицияВСтроке,1);
		
		Если Символ = "{" Тогда
			Если Результат = Неопределено Тогда
				Результат              = Новый Структура;
				СтруктураДляЗаполнения = Результат;
			КонецЕсли;	 
			
		ИначеЕсли Символ = "}" Тогда
			
		ИначеЕсли Символ = """" Тогда
			ТекИмя = ПолучитьИмяПараметра(ТаблицаЗначенийИзФайла,СтрокаИзФайла,СчетчикСтрок,ПозицияВСтроке);
			//Сообщить("ТекИмя="+ТекИмя);
			
			
		ИначеЕсли Символ = ":" Тогда
			//ТекЗначение = Неопределено;
			Значение = ПолучитьЗначениеИзJSON(ТаблицаЗначенийИзФайла,СтрокаИзФайла,СчетчикСтрок,ПозицияВСтроке,Результат);
			СтруктураДляЗаполнения.Вставить(ТекИмя,Значение);
			Прервать;
		Иначе
			ТекстСообщения = "Ошибка чтения JSON. Неизвестный символ %1";
			ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",Символ);
			Сообщить(ТекстСообщения);
			Возврат;
		КонецЕсли;	 
	КонецЦикла;
КонецПроцедуры


Функция ПрочитатьСтруктуруИзJSONФайла(ИмяФайлаVBParams,ПараметрыУФ = Неопределено) Экспорт
	Результат              = Неопределено;
	СтруктураДляЗаполнения = Неопределено;
	ТекЗначение            = Неопределено;
	
	
	ТаблицаЗначенийИзФайла = Новый ТаблицаЗначений;
	ТаблицаЗначенийИзФайла.Колонки.Добавить("Стр");
	
	
	Если ПараметрыУФ = Неопределено Тогда
		ИмяФайла = ИмяФайлаVBParams;
	Иначе	
		VBParamsДвоичныеДанные = ПараметрыУФ.VBParamsДвоичныеДанные;
		ИмяФайла               = ПолучитьИмяВременногоФайла("json");
		VBParamsДвоичныеДанные.Записать(ИмяФайла);
	КонецЕсли;	 
	
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФайла,"UTF-8");
	
	ТекИмя = Неопределено;
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = СокрЛП(Стр);
		Если Стр = "" Тогда
			Продолжить;
		КонецЕсли;	 
		
		
		СтрТаблицаЗначенийИзФайла     = ТаблицаЗначенийИзФайла.Добавить();
		СтрТаблицаЗначенийИзФайла.Стр = Стр;
	КонецЦикла;	
	
	Текст.Закрыть();
	
	СчетчикСтрок = -1;
	Пока Истина Цикл
		СчетчикСтрок = СчетчикСтрок + 1;
		Если СчетчикСтрок > (ТаблицаЗначенийИзФайла.Количество()-1) Тогда
			Прервать;
		КонецЕсли;	 
		
		ПозицияВСтроке = 0;
		//Сообщить("ОбработатьСтроку: " + ТаблицаЗначенийИзФайла[СчетчикСтрок].Стр);
		ОбработатьСтроку(ТаблицаЗначенийИзФайла,ТаблицаЗначенийИзФайла[СчетчикСтрок].Стр,СчетчикСтрок,ПозицияВСтроке,Результат,СтруктураДляЗаполнения);
	КонецЦикла; 
	
	
	Возврат Результат;
КонецФункции	
