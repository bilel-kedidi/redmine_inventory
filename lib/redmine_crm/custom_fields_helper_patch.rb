# This file is a part of Redmine CRM (redmine_contacts) plugin,
# customer relationship management plugin for Redmine
#
# Copyright (C) 2011-2015 Kirill Bezrukov
# http://www.redminecrm.com/
#
# redmine_contacts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# redmine_contacts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with redmine_contacts.  If not, see <http://www.gnu.org/licenses/>.

require_dependency 'custom_fields_helper'

module RedmineCrm
    module CustomFieldsHelperPatch
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
          # alias_method_chain :custom_fields_tabs, :contacts_tab
        end
      end

    end

    module InstanceMethods
      def custom_fields_tabs_with_contacts_tab
        new_tabs = []
        new_tabs << {:name => 'InventoryCustomField', :partial => 'custom_fields/index', :label => :label_inventory_plural}
        return custom_fields_tabs_without_contacts_tab | new_tabs
      end
    end

end

  CustomFieldsHelper::CUSTOM_FIELDS_TABS << {:name => 'InventoryCustomField', :partial => 'custom_fields/index', :label => :label_inventory_plural}

