$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'extlib'

module Eyeballer
  module ClassMethods
    def observe(name, actions = {})

      observer_klass = self
      class_name =  ::Extlib::Inflection.camelize(name)
      klass = ::Extlib::Inflection.constantize(class_name)

      klass.class_eval do

        cattr_accessor :eyeballed_methods
        self.eyeballed_methods ||= Hash.new { |hash, key| hash[key] = {} }
        self.eyeballed_methods[observer_klass].merge!(actions) do |key, oldval, newval|
          (Array(oldval).flatten << newval).uniq
        end

        unless method_defined? :observer_klasses
          def observer_klasses(name)
            self.class.eyeballed_methods.map do |observer_klass, hooks|
              observer_klass if hooks.keys.detect(name)
            end.compact
          end
        end

        unless method_defined? :eyeball_executer
          define_method :eyeball_executer do |name|
            observer_klasses(name).each do |observer_klass|
              observer_klass_instance = observer_klass.new
              Array(self.class.eyeballed_methods[observer_klass][name]).each do |hook|
                if observer_klass_instance.method(hook).arity > 0
                  observer_klass_instance.send(hook, self)
                else
                  observer_klass_instance.send(hook)
                end
              end
            end
          end
        end

        actions.keys.each do |method_name|
          # Pinched from alias_method_chain:
          method_name_without_punctuation, punctuation = method_name.to_s.sub(/([?!=])$/, ''), $1
          aliased_name = "#{method_name_without_punctuation}_without_eyeball#{punctuation}"
          unless method_defined? aliased_name
            alias_method aliased_name, method_name
            define_method method_name do |*args|
              result = self.send(aliased_name, *args)
              eyeball_executer(method_name)
              result
            end
          end
        end

      end
    end
  end

  module InstanceMethods
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
