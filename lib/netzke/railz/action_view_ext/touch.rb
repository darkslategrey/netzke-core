module Netzke
  module Railz
    module ActionViewExt
      # Implementation of Touch-specific helpers
      module Touch #:nodoc:

        protected

          def netzke_touch_css_include(params)
            # Note: no themes for now

            res = stylesheet_link_tag("/sencha-touch/resources/css/sencha-touch")

            # Netzke-related (dynamically generated by NetzkeController)
            res << "\n" << stylesheet_link_tag("/netzke/touch")

            res
          end

          def netzke_touch_js(params)
            res = []
            res << content_for(:netzke_js_classes)
            res << "\n"

            res << "Ext.setup({"
              res << "onReady: function(){"
              res << content_for(:netzke_on_ready)
              res << "}"
            res << "});"

            javascript_tag res.join("\n")
          end


          def netzke_touch_js_include(params)
            # ExtJS
            res = if ENV['RAILS_ENV'] == 'development'
              ["/sencha-touch/sencha-touch-debug.js"]
            else
              ["/sencha-touch/sencha-touch"]
            end

            # Netzke
            res << "/netzke/touch"

            javascript_include_tag(res, :cache => params[:cache])
          end

      end
    end
  end
end
