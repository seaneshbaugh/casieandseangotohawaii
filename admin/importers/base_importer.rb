class BaseImporter
  def self.import_attrbites
    raise NotImplementedError
  end

  def self.model
    raise NotImplementedError
  end

  def initialize(data_file_path)
    @data_file_path = data_file_path

    @records = YAML.load_file(data_file_path)

    instance_variable_set("@#{self.class.model.name.downcase.pluralize}", @records)
  end

  def import!
    ActiveRecord::Base.transaction do
      create_or_update_records
      destroy_missing_records
    end
  end

  private

  def attributes_from_record(record)
    record.slice(*self.class.import_attributes)
  end

  def create_or_update_records
    @records.each do |record|
      existing_record = self.class.model.where(id: record['id']).first

      begin
        attributes = attributes_from_record(record)

        if existing_record
          existing_record.update!(attributes)
        else
          puts attributes.inspect
          existing_record = self.class.model.create!(attributes)
        end
      rescue ActiveRecord::RecordInvalid, ActiveRecord::InvalidForeignKey, ActiveRecord::NotNullViolation, ArgumentError => e
        warn "Error creating or updating #{self.class.model.name} record."
        warn "record = #{record.inspect}"
        warn "attributes = #{attributes.inspect}"
        warn "existing_record = #{existing_record.inspect}"

        raise e
      end
    end
  end

  def destroy_missing_records
    ids = @records.map { |record| record['id'] }

    records_to_delete = self.class.model.where.not(id: ids)

    records_to_delete.each(&:destroy)
  end
end
