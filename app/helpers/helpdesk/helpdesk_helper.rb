module Helpdesk
  module HelpdeskHelper
    def menu_left(title,&block)
      content_tag(:fieldset) do
        content_tag(:legend ,title) +
        content_tag( :ul, class: 'nav nav-list') do
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

    def ico(name,color='black')
      raw("<i class=\"icon-#{name} icon-#{color}\"></i> ")
    end

    def parent_layout(layout)
      @view_flow.set(:layout,output_buffer)
      self.output_buffer = render(:file => "layouts/#{layout}")
    end
  end
end
