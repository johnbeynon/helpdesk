require 'rails/generators'
module Helpdesk
	module Generators
		class InstallGenerator < Rails::Generators::Base
			class_option "user-class", :type => :string
			class_option "no-migrate", :type => :boolean
			class_option "current-user-helper", :type => :string

			source_root File.expand_path("../install/templates", __FILE__)
			desc "Used to install Helpdesk"

			def install_migrations
				puts "Copying over Help migrations..."
				Dir.chdir(Rails.root) do
					`rake helpdesk:install:migrations`
				end
			end

			def determine_user_class
				#	 Is there a cleaner way to do this?
				if options["user-class"]
					@user_class = options["user-class"]
				else
					@user_class = ask("What is your user class called? [User]")
				end

				if @user_class.blank?
					@user_class = 'User'
				else
					@user_class = @user_class
				end
			end

			def add_helpdesk_admin_migration
				puts "Adding helpdesk_admin migration..."
				template "helpdesk_admin_migration.rb", "#{Rails.root}/db/migrate/#{next_migration_number}_add_helpdesk_admin.rb"
			end

			def determine_current_user_helper
				if options["current-user-helper"]
					current_user_helper = options["current-user-helper"]
				else
					current_user_helper = ask("What is the current_user helper called in your app? [current_user]")
				end
				current_user_helper = :current_user if current_user_helper.blank?
				puts "Defining helpdesk_user method inside ApplicationController..."

				forem_user_method = %Q{
				def helpdesk_user
					#{current_user_helper}
				end
				helper_method :helpdesk_user
				}

				inject_into_file("#{Rails.root}/app/controllers/application_controller.rb",
					helpdesk_user_method,
					:after => "ActionController::Base\n")
			end

			def add_helpdesk_initializer
				path = "#{Rails.root}/config/initializers/helpdesk.rb"
				if File.exists?(path)
					puts "Skipping config/initializers/helpdesk.rb creation, as file already exists!"
				else
					puts "Adding helpdesk initializer (config/initializers/helpdesk.rb)..."
					template "initializer.rb", path
				end
			end

			def run_migrations
				unless options["no-migrate"]
					puts "Running rake db:migrate"
					`rake db:migrate`
				end
			end

			def mount_engine
				puts "Mounting Helpdesk::Engine at \"/support\" in config/routes.rb..."
				insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
					%Q{	 mount Helpdesk::Engine, :at => "/support"\n}
				end
			end

			def finished
				output = "\n\n" + ("*" * 53)
				output += %Q{\nDone! Helpdesk has been successfully installed. Yaaaaay!

				Here's what happened:\n\n}
				output += step("Forem's migrations were copied over into db/migrate.\n")
				output += step("We created a new migration called AddForemAdminToTable.
				This creates a new field called \"forem_admin\" on your #{user_class} model's table.\n")
				output += step("A new method called `forem_user` was inserted into your ApplicationController.
				This lets Forem know what the current user of your application is.\n")
				output += step("A new file was created at config/initializers/forem.rb
				This is where you put Forem's configuration settings.\n")

				unless options["no-migrate"]
					output += step("`rake db:migrate` was run, running all the migrations against your database.\n")
					output += step("Seed forum and topic were loaded into your database.\n")
				end
				output += step("The engine was mounted in your config/routes.rb file using this line:

				mount Forem::Engine, :at => \"/forums\"

				If you want to change where the forums are located, just change the \"/forums\" path at the end of this line to whatever you want.")
				output += %Q{\nAnd finally:

				#{step("We told you that Forem has been successfully installed and walked you through the steps.")}}
				output += "\nIf you have any questions, comments or issues, please post them on our issues page: http://github.com/radar/forem/issues.\n\n"
				output += "Thanks for using Forem!"
				puts output
			end

			private

			def step(words)
				@step ||= 0
				@step += 1
				"#{@step}) #{words}\n"
			end

			def user_class
				@user_class
			end

			def next_migration_number
				last_migration = Dir[Rails.root + "db/migrate/*.rb"].sort.last.split("/").last
				current_migration_number = /^(\d+)_/.match(last_migration)[1]
				current_migration_number.to_i + 1
			end
		end
	end
end


