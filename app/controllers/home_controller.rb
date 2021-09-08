# frozen_string_literal: true

require 'csv'

# Home Controller
class HomeController < ApplicationController
  # GET '/'
  def index
    @people = Person.all
  end

  # POST '/upload_csv'
  def upload_csv
    @people_records = []
    CSV.foreach(csv_params[:csv_file], headers: true, converters: :all, header_converters: :symbol) do |row|
      person = Person.new
      row.to_hash.keys.each do |key|
        person.send(:"#{key}=", row.to_hash[key])
      end
      person.uniq_id = person_uniq_id unless person.save
      @people_records << person
    end
    @people_records
  end

  # POST '/create'
  def create
    @person = Person.new(person_params)
    @person.save
    @person
  end

  private

  def csv_params
    params.require(:person).permit(:csv_file)
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :phone, :uniq_id)
  end

  def person_uniq_id
    SecureRandom.hex
  end
end
