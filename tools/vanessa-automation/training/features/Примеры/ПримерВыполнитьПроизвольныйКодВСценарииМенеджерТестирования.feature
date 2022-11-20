﻿# language: ru

Функциональность: Примеры, как выполнить произвольный код в сценарии

Сценарий: Примеры, как выполнить произвольный код в сценарии. На стороне МЕНЕДЖЕРА тестирования.

	* Код выполняется на клиенте
		И я выполняю код встроенного языка
		"""bsl
			Сообщить("Hello world.")
		"""
		
	* Код выполняется на сервере с контекстом Vanessa Automation
		И я выполняю код встроенного языка на сервере
		"""bsl
			Сообщить("Hello world.")
		"""		
	
	* Код выполняется на сервере без контекста Vanessa Automation
		И я выполняю код встроенного языка на сервере без контекста
		"""bsl
			Сообщить("Hello world.")
		"""		
	
