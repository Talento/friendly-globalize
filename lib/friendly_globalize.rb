require "friendly_globalize/version"
require "friendly_id"
require "globalize"
require "globalize-accessors"

module FriendlyGlobalize

  extend ActiveSupport::Concern
  extend FriendlyId

  included do
    before_save :set_localized_slug_and_remove_blanks
  end

  def set_localized_slug_and_remove_blanks
    remove_blank_from_friendly_field
    set_localized_slug
  end

  private
  def set_localized_slug
    each_locale_except_current do |localized_friendly_id_field, locale|
      set_friendly_id(self.send(localized_friendly_id_field), locale) unless self.send(localized_friendly_id_field).blank?
    end    
  end

  def remove_blank_from_friendly_field
    each_locale_except_current do |localized_friendly_id_field, locale|
      self.send("#{localized_friendly_id_field}=", nil) if self.send(localized_friendly_id_field).blank?
    end
  end

  def each_locale_except_current
    (I18n.available_locales - [I18n.locale]).each do |locale|
      friendly_id_field = "#{self.class.friendly_id_config.base}"
      yield "#{friendly_id_field}_#{locale}", locale
    end
  end

end
