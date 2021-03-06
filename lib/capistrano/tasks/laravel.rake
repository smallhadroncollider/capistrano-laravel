namespace :laravel do
    desc <<-DESC
        Creates laravel directories
        This is best used after deploy:updating
    DESC

    task :create_paths do
        on roles(:app) do
            info "Creating storage directories"
            execute "mkdir -m 775 -p #{shared_path}/storage/framework/cache"
            execute "mkdir -m 775 -p #{shared_path}/storage/framework/sessions"
            execute "mkdir -m 775 -p #{shared_path}/storage/framework/views"

            info "Creating bootstrap cache directory"
            execute "mkdir -m 775 -p #{release_path}/bootstrap/cache"
        end
    end


    desc <<-DESC
        Optimises laravel for production 
        This is best used after deploy:published
    DESC

    task :optimize do
        on roles(:app) do
            info "Caching routes"
            execute "php #{current_path}/artisan route:cache"

            info "Caching config"
            execute "php #{current_path}/artisan config:cache"
        end
    end

    desc <<-DESC
        Clear cached views 
        This is best used after deploy:published
    DESC

    task :clear do
        on roles(:app) do
            info "Clearing cached views"
            execute "php #{current_path}/artisan view:clear"
        end
    end

    desc <<-DESC
        Migrates the database 
        This is best used after deploy:published
        Probably shouldn't run on production
    DESC

    task :migrate_db do
        on roles(:app) do
            execute "php #{current_path}/artisan migrate"
            info "Migrating DB"
        end
    end

    desc <<-DESC
        Backup the database 
        This is best used after deploy:published but before :migrate_db
        Requires "backup-manager/laravel" package
    DESC

    task :backup_db do
        on roles(:app) do
            execute "php #{current_path}/artisan db:backup --database=mysql --destination=local --destinationPath=`date +\%Y/%d-%m-%Y` --compression=gzip"
            info "Backing Up DB"
        end
    end
end
