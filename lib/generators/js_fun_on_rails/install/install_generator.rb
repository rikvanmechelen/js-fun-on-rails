require 'generators/js_fun_on_rails/helpers'
require 'rails'

module JsFunOnRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include JsFunOnRails::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      # desc "Generates a Backbone.js skeleton directory structure and mainfest"

      class_option :javascript, :type => :boolean, :aliases => "-j", :default => false,
                                :desc => "Generate JavaScript"

      def inject_backbone
        libs = ['js-fun-on-rails']
        paths = ['../templates', './models', './collections', './views', './routers']

        begin
          file = 'application.js'
          if FileTest.exists?("#{js_path}/application.js.coffee")
            file = 'application.js.coffee'
          end
        rescue
          # TODO: catch error, show feedback
        end

        inject_into_file "#{js_path}/#{file}", :before => "//= require_tree" do
          out = ""
          out << libs.map{ |lib| "//= require #{lib}" }.join("\n")
          out << "\n"
        end
      end
    end
  end
end
