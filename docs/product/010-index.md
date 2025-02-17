---
title: Описание
---

# extends

[![Тестирование](https://github.com/nixel2007/extends/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/nixel2007/extends/actions/workflows/test.yml)
[![Статус порога качества](https://sonar.openbsl.ru/api/project_badges/measure?project=extends&metric=alert_status)](https://sonar.openbsl.ru/dashboard?id=extends)

`extends` - это библиотека для реализации наследования через композицию и делегирование в OneScript.

## Установка

Для установки библиотеки используйте команду:

```sh
opm install extends
```

## Описание

Язык 1С:Предприятие как и OneScript не поддерживает концепцию наследования классов. Однако же нам доступны принципы композиции и делегирования, а так же механизм кодогенерации и загрузки сценария из строки.

Имея на руках два объекта, один из которых выступает в роли родителя, а другой в роли наследника, мы можем сгенерировать новый объект, который будет обладать всеми методами родителя и наследника.

Библиотека `extends` активно использует возможности, предоставляемые библиотеками [`reflector`](https://github.com/oscript-library/reflector) и [`decorator`](https://github.com/nixel2007/decorator).

## Лицензия

Этот проект лицензируется под лицензией MIT. Подробности см. в файле LICENSE.md.

