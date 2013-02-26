# encoding: utf-8
class Admin::Service < ActionMailer::Base
  default from: "admin@alanyaproperties.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service.transfer.subject
  #
  def transfer
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service.contacts.subject
  #
  def contacts(contact_message)
    @settings = Setting.type('contacts').first
    @contact_message = contact_message

    mail to: @settings.emails, subject: "Новое сообщение ##{@contact_message.id}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin.service.order.subject
  #
  def order(order)
    @settings = Setting.type('contacts').first
    @order = order

    mail to: @settings.emails, subject: "Новый запрос ##{@order.id}"
  end
end
