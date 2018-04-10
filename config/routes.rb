Rails.application.routes.draw do
    root 'home#click'
    
    get 'home/click'
    
    get 'home/index'
end
