# encoding: utf-8
require 'ostruct'
class PropertyAttributesStruct < OpenStruct
  include Enumerable

  def each(&block)
    attrs = marshal_dump
    pattrs = PropertyAttribute.where(name: attrs.keys).all
    pattrs.each do |attr|
      value = attrs[attr.name.to_sym]

      yield attr, value
    end
  end
end

class PropertyAttribute < ActiveRecord::Base
  default_scope { order(:position) }
  attr_accessible :default, :name, :options, :position, :attribute_type

  ATTRIBUTE_TYPES = %w{boolean string}
  BOOLEAN_ANSWER = %w{нет есть}

  def answer(value)
    case attribute_type
      when 'boolean'
        BOOLEAN_ANSWER[value.to_i]
      else
        value
    end
  end
end
