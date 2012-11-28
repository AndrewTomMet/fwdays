# language: ru
Функционал: Регистрируем пользователя, проверяем автоподписку на активные ивенты

    Сценарий: Открыть страницу регистрации, убедиться в ее существовании, заполнить форму и получить успешное сообщение
        Допустим я на странице "/register/"
        Тогда код ответа сервера должен быть 200
        И я заполняю поле "fos_user_registration_form_fullname" значением "Jack Smith"
        И я заполняю поле "fos_user_registration_form_email" значением "test@fwdays.com"
        И я заполняю поле "fos_user_registration_form_plainPassword" значением "qwerty"
        И я нажимаю "Регистрация"
        Тогда код ответа сервера должен быть 200
        И я должен быть на странице "/register/check-email"
        И у меня должна быть подписка на все активные ивенты

    Сценарий: Заполнить форму регистрации без указания имени и убедиться в выводе ошибки
        Допустим я на странице "/register/"
        Тогда код ответа сервера должен быть 200
        И я заполняю поле "fos_user_registration_form_email" значением "test@fwdays.com"
        И я заполняю поле "fos_user_registration_form_plainPassword" значением "qwerty"
        И я нажимаю "Регистрация"
        Тогда код ответа сервера должен быть 200
        И я должен быть на странице "/register/"
        И я должен видеть "Значение не должно быть пустым."

    Сценарий: Заполнить форму регистрации без указания email и убедиться в выводе ошибки
        Допустим я на странице "/register/"
        Тогда код ответа сервера должен быть 200
        И я заполняю поле "fos_user_registration_form_fullname" значением "Jack Smith"
        И я заполняю поле "fos_user_registration_form_plainPassword" значением "qwerty"
        И я нажимаю "Регистрация"
        Тогда код ответа сервера должен быть 200
        И я должен быть на странице "/register/"
        И я должен видеть "Пожалуйста, укажите Ваш email"

    Сценарий: Заполнить форму регистрации без указания пароля и убедиться в выводе ошибки
        Допустим я на странице "/register/"
        Тогда код ответа сервера должен быть 200
        И я заполняю поле "fos_user_registration_form_fullname" значением "Jack Smith"
        И я заполняю поле "fos_user_registration_form_email" значением "test@fwdays.com"
        И я нажимаю "Регистрация"
        Тогда код ответа сервера должен быть 200
        И я должен быть на странице "/register/"
        И я должен видеть "Пожалуйста, укажите пароль"

    Сценарий: Зайти на страницу регистрации, заполнить все обязательные поля и увидеть сообщение об успешной регистрации
        Допустим я на странице "/register/"
        И я заполняю обязательные поля формы: имя - "Jack Smith", e-mail - "test@fwdays.com", пароль - "qwerty"
        Когда я нажимаю "Регистрация"
        Тогда я должен быть на странице "/register/check-email"
        И я должен видеть текст соответствующий "Пользователь успешно создан"
        И я должен видеть текст соответствующий "На электронную почту test@fwdays.com выслано письмо с ссылкой для подтверждения регистрации."

    Сценарий: Зайти на страницу регистрации, заполнить все обязательные и дополнительные поля и увидеть сообщение об успешной регистрации
        Допустим я на странице "/register/"
        Тогда я заполняю обязательные поля формы: имя - "Jack Smith", e-mail - "test2@fwdays.com", пароль - "qwerty"
        И я заполняю дополнительные поля формы: страна - "Укрина", город - "Хмельницкий", компания - "Stfalcon", должность - "Web Developer"
        Когда я нажимаю "Регистрация"
        Тогда я должен быть на странице "/register/check-email"
        И я должен видеть текст соответствующий "Пользователь успешно создан"
        И я должен видеть текст соответствующий "На электронную почту test2@fwdays.com выслано письмо с ссылкой для подтверждения регистрации."

    # В этому сценарии для тестирования оптравки письма используется профайлер симфони. Но еще нужно отключить для него редирект страниц
    # В последнем методе редирект включается обратно, чтоб срабатывали следующие тесты
    Сценарий: Протестировать отправку имейла после регистрации
        Допустим я на странице "/register/"
        И редирект страниц отключен
        Тогда я заполняю обязательные поля формы: имя - "Jack Smith", e-mail - "test@fwdays.com", пароль - "qwerty"
        Когда я нажимаю "Регистрация"
        Тогда email with subject "Добро пожаловать test@fwdays.com!" should have been sent to "test@fwdays.com"
