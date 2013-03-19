# encoding: utf-8
class Admin::ServiceMailer < ActionMailer::Base
  default from: "admin@alanyaproperties.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service_mailer.transfer.subject
  #
  def transfer(transfer)
    @settings = Setting.type('contacts').first
    @transfer = transfer

    mail to: @settings.emails, subject: "Заказ трансфера ##{@transfer.id}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service_mailer.contacts.subject
  #
  def contacts(contact_message)
    @settings = Setting.type('contacts').first
    @contact_message = contact_message

    mail to: @settings.emails, subject: "Новое сообщение ##{@contact_message.id}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service_mailer.order.subject
  #
  def order(order)
    @settings = Setting.get('contacts')
    @order = order

    mail to: @settings.emails, subject: "Новый запрос ##{@order.id}"
  end
end
