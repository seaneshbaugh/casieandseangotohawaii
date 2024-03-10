module Admin
  def self.project_root_directory
    @project_root_directory ||= File.expand_path(File.join(__dir__, '..'))
  end

  def self.admin_directory
    @admin_directory ||= File.join(project_root_directory, 'admin')
  end

  def self.db_directory
    @db_directory ||= File.join(admin_directory, 'db')
  end

  def self.migrations_directory
    @migrations_directory ||= File.join(db_directory, 'migrations')
  end

  def self.data_directory
    @data_directory ||= File.join(project_root_directory, 'data')
  end

  def self.database_path
    @database_path ||= File.join(db_directory, 'development.db')
  end

  def self.schema_path
    @schema_path ||= File.join(db_directory, 'schema.rb')
  end

  def self.data_path
    @data_path ||= File.join(project_root_directory, 'data')
  end

  # TODO: Make this a command line option.
  def self.export_path
    @export_path ||= data_path

    # @export_path ||= File.join(project_root_directory, 'data_test')
  end
end
