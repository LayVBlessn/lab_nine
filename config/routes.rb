Rails.application.routes.draw do
    root 'hypothesis#input'
    get 'hypothesis/input'
    get 'hypothesis/view'
end
