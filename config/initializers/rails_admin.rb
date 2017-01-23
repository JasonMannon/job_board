RailsAdmin.config do |config|  
  config.authorize_with do
    redirect_to main_app.root_path unless (current_user && (current_user.has_role? :admin))
  end  

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
