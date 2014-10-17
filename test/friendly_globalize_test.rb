require 'test_helper'

class Unit < ActiveRecord::Base
  translates :name, :title, :slug
  globalize_accessors

  extend FriendlyId
  include FriendlyGlobalize

  friendly_id :name, use: [:slugged, :globalize]

end

describe FriendlyGlobalize do

  describe "#save" do
    let(:unit) {Unit.new(name_es: 'test-name-es', name_en: "")   }

    before(:each) do
      unit.save
    end

    it "should set friendly_id_en to nil" do
      Globalize.with_locale(:en) do
        unit.friendly_id.must_equal nil
      end
    end

    it "should set the friendly_id_es to" do
      unit.friendly_id.include?("test-name-es").must_equal true
    end

  end


end
