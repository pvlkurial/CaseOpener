class ViewController {

    BaseView@ currentView;
    array<BaseView@> tabs;

    ViewController(){
        tabs.InsertLast();
        @currentView = InventoryView();
    }

    void renderView(){
        // pass the object
        currentView.render();
    }

    void renderTab(BaseView@ &in tab){

        UI::BeginTabItem(tab.label, tab.id == currentView.id, UI::TabItemFlags::None);
        if(tab.id == currentView.id){
            renderView();
        }

        UI::EndTabItem();
       
    }

    void tabBar(){
        UI::BeginTabBar();
        for(int i = 0 ; i < tabs.Lenght ; i++){
            renderTab(tabs[i]);
        }

        UI::EndTabBar();

    }
}