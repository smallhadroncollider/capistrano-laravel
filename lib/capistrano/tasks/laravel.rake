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
end
