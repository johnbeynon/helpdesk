module Helpdesk
  class Faq < ActiveRecord::Base
    translates :title, :text
    accepts_nested_attributes_for :translations

    acts_as_ordered_tree

    default_scope {order('position ASC').includes(:translations)}

    scope :active,  -> {where(active:  true)}
    scope :inactive,  -> {where(active: false)}

    def name_with_depth
      "#{"&nbsp;&nbsp;&nbsp;&nbsp;"*depth}\\_ #{title}".html_safe
    end

    def to_param
      id ? "#{id}-#{nname}" : nil
    end

    def nname
      if parent
        "#{parent.nname}--#{title.parameterize}"
      else
        "#{title.parameterize}"
      end
    end

    def self.search(query, page=1)
      query = "%#{query}%"
      arel_faqs_t = Arel::Table.new(:helpdesk_faq_translations)
      name_match = arel_faqs_t[:title].matches(query)
      postal_match = arel_faqs_t[:text].matches(query)
      with_translations.active.where(name_match.or(postal_match)).page(page)
    end

    def anchor
      "##{to_param}"
    end

    def self.collection
      arr = []
      roots.each do |faq|
        arr << faq
        arr << faq.descendants
      end
      return arr.flatten
    end
  end
end
