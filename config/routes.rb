Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: "pages#index"
    resources :categories do
      resources :posts
    end
  end
end
