require 'csv'

class ExportsController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.csv{send_data to_csv(@users), filename: "users-#{Date.today}.csv"}
    end
  end

  private

  def to_csv(users)
    CSV.generate(headers: true) do |csv|
      csv << ["Name", "Email", "Image"]

      users.each do |user|
        csv << [user.name, user.email, user.image]
      end
    end
  end
end
