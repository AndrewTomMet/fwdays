# language: ru

Функционал: Тест контроллера MailAdminController
Тестируем рассылки

    Сценарий: Проверяем создание рассылки без параметров
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я должен видеть "Jack Sparrow" внутри элемента ".table.table-bordered.table-striped"
        И я должен видеть "Michael Jordan" внутри элемента ".table.table-bordered.table-striped"

    Сценарий: Проверяем создание рассылки по евенту и статусу оплаты для несуществующих данных
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        И я выбираю "Javascript Frameworks Day" в поле "Event"
        И я выбираю "Оплачено" в поле "Payment Status"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я не должен видеть элемент ".table.table-bordered.table-striped"

    Сценарий: Проверяем создание рассылки по евенту и статусу оплаты для существующих данных
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        И я выбираю "PHP Frameworks Day" в поле "Event"
        И я выбираю "Не оплачено" в поле "Payment Status"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я должен видеть "Jack Sparrow" внутри элемента ".table.table-bordered.table-striped"
        И я должен видеть "Michael Jordan" внутри элемента ".table.table-bordered.table-striped"
        И пользователь "Jack Sparrow" должен быть в списке только один раз
        И пользователь "Michael Jordan" должен быть в списке только один раз

    Сценарий: Проверяем создание рассылки по нескольким евентам и статусу оплаты для существующих данных
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        И я выбираю "Zend Framework Day" в поле "Event"
        И я выбираю "PHP Frameworks Day" в поле "Event"
        И я выбираю "Не оплачено" в поле "Payment Status"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я должен видеть "Jack Sparrow" внутри элемента ".table.table-bordered.table-striped"
        И я должен видеть "Michael Jordan" внутри элемента ".table.table-bordered.table-striped"
        И я не должен видеть "Peter Parker" внутри элемента ".table.table-bordered.table-striped"
        И пользователь "Michael Jordan" должен быть в списке только один раз

    Сценарий: Отправка e-mail для пользователей
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        И я ставлю галочку "Start"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я должен видеть "Jack Sparrow" внутри элемента ".table.table-bordered.table-striped"
        И я должен видеть "Michael Jordan" внутри элемента ".table.table-bordered.table-striped"
        И я перехожу на "/admin/stfalcon/event/mail/user-send"
        Тогда email with subject "Тестовый заголовок" should have been sent to "admin@fwdays.com"
        Тогда email with subject "Тестовый заголовок" should have been sent to "user@fwdays.com"

    Сценарий: Отправка e-mail для пользователей при выборе нескольких евентов
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        Если я кликаю по ссылке "Добавить новый"
        Тогда я на странице создания рассылки
        И код ответа сервера должен быть 200
        И я заполняю поле "Title" значением "Тестовый заголовок"
        И я заполняю поле "Text" значением "Текст сообщение"
        И я выбираю "Zend Framework Day" в поле "Event"
        И я выбираю "PHP Frameworks Day" в поле "Event"
        И я ставлю галочку "Start"
        Если я нажимаю "btn_create_and_edit"
        Тогда код ответа сервера должен быть 200
        Тогда я должен видеть "Элемент создан успешно"
        Если я кликаю по ссылке "Line items"
        Тогда код ответа сервера должен быть 200
        И я должен видеть "Michael Jordan" внутри элемента ".table.table-bordered.table-striped"
        И я перехожу на "/admin/stfalcon/event/mail/user-send"
        Тогда email with subject "Тестовый заголовок" should have been sent to "user@fwdays.com"

    Сценарий: Отправка e-mail для админа
        Допустим я вхожу в учетную запись с именем "admin@fwdays.com" и паролем "qwerty"
        И я перехожу на страницу со списком рассылок
        Тогда код ответа сервера должен быть 200
        И I do not follow redirects
        И я должен видеть "Отправить Админам"
        Если я кликаю по ссылке "Отправить Админам"
        Тогда email with subject "test" should have been sent to "admin@fwdays.com"
        Тогда email with subject "test" should have not been sent to "user@fwdays.com"
