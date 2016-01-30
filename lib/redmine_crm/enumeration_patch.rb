require_dependency 'enumeration'

module  RedmineCrm
  module EnumerationPatch
    def self.included(base)
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)
      base.class_eval do
        require_dependency 'inventory_activity'
      end
    end

  end
  module ClassMethods


  end

  module InstanceMethods

  end

end