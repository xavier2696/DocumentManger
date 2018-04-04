# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html
namespace :export do
  desc "Prints User.all in a seeds.rb way."
  task :seeds_format => :environment do
    #Rails.configuration.filter_parameters = ''
    #p Rails.configuration.filter_parameters
    Department.order(:id).all.each do |department|
      puts "Department.create(#{department.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
    
    User.order(:id).all.each do |user|
      #pass=user.encrypted_password
      #p pass
      puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      #puts "User.create(#{user.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')},\"encrypted_password\"=>\"#{pass}\")"
    end
  end
end
