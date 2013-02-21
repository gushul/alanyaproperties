# encoding: UTF-8
# Comma separated email list validator

class EmailListValidator < ActiveModel::EachValidator

  EmailAddress = %r/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  def validate_each(record, attribute, value)
    emails = value.split(/\s*,\s*/)

    emails.each do |email|
      record.errors.add(attribute, options[:message] || "invalid email list") unless email =~ EmailAddress
    end
  end
end
