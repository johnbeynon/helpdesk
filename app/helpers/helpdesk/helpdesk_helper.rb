module Helpdesk
  module HelpdeskHelper


    def menu_left(title,&block)
      panel_menu(title,'default',&block)
    end

    def panel_menu(title,type,&block)
      content_tag(:div,class: "panel panel-#{type}") do
        content_tag(:div ,class: 'panel-heading') do
          content_tag(:h3 ,title,class:'panel-title')
        end +
        content_tag( :ul, class: 'nav nav-pills nav-stacked ') do
          capture(&block)
        end
      end
    end

    def menu_li(lbl, path, *args)
      options = args.extract_options!
      (options[:class].nil? ? options.merge!(:class => "active") : options[:class] += " active" ) if url_for(path) == request.fullpath
      content_tag(:li, link_to(lbl, path), options)
    end

    def status_label(lbl,cls)
      content_tag(:span, class: "label #{cls}") do
        lbl
      end
    end

    def badge(num,css='pull-right')
      raw("<span class=\"badge #{css}\">#{num}</span> ")
    end

    def ico(name)
      raw("<i class=\"glyphicon glyphicon-#{name}\"></i> ")
    end

    def parent_layout(layout)
      @view_flow.set(:layout,output_buffer)
      self.output_buffer = render(:file => "layouts/#{layout}")
    end
  end
end
