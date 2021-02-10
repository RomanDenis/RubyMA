require 'csv'
namespace :user do
  desc "import"
  task import: :environment do
    _, file_path = ARGV
    CSV.foreach(file_path, headers: true) do |row|
      User.create! row.to_hash
    end
  end

  desc "export"
  task export: :environment do
    file = "user_data.csv"

    users = User.order(:first_name)

    headers = %w[first_name last_name personal_data password email birthday]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      users.each do |user|
        writer << [user.first_name, user.last_name, user.personal_data.to_json, user.password, user.email, user.birthday]
      end
    end
  end
end