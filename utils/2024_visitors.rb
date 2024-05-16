require 'active_record'
require 'active_support/all'

$LOAD_PATH.unshift(File.expand_path(File.join('..', 'admin'), __dir__))

require_relative '../admin/admin'
require_relative '../admin/models/visitor'

ActiveRecord::Base.logger = Logger.new($stdout)

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Admin.database_path)

visit_ids = (126..174)

visit_ids.each do |visit_id|
  Visitor.create(visit_id: visit_id, person_id: 1)
  Visitor.create(visit_id: visit_id, person_id: 2)
end
