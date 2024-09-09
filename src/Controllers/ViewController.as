class ViewController {

    BaseView@ currentView;
    array<BaseView@> tabs;
    DataController@ dc;
    string prevViewId = "";
    int activeTabIndex = 0;

    ViewController(){
        @dc = DataController();
        //@currentView = InventoryView(dc);
        tabs.InsertLast(InventoryView(dc, this));
        tabs.InsertLast(VoucherView(dc, this));
        tabs.InsertLast(DetailedCaseView(dc, this));

        @currentView = @tabs[0];
        currentView.selected = true;
        print(tabs.Length);
    }

    void renderView(){
        // pass the object
        currentView.render();
    }

    void renderTab(BaseView &in tab){
       if(UI::BeginTabItem(tab.id, tab.selected ? UI::TabItemFlags::SetSelected : 0)){
            renderView();
            //changeCurrentView(tab.id);
            UI::EndTabItem();
        }
        if(UI::IsItemClicked()){
            changeTab(tab.id);
        }
    }

    void changeTab(const string &in id){
        currentView.selected = false;
        changeCurrentView(id);
        currentView.selected = true;
    }

    void tabBar(){
        UI::BeginTabBar("tabbar", UI::TabBarFlags::None);
        for(int i = 0 ; i < tabs.Length ; i++){
            renderTab(tabs[i]);
        }
        UI::EndTabBar();
    }

    void viewToInventory(){
        dc.getCases();
        @currentView = tabs[0];
    }

    void changeCurrentView(const string &in id){
        if(id == "inventory"){
            print("Inventory");
            viewToInventory();
            return; 
        }
        if(id == "voucher"){
            print("Voucher");
            viewToVoucher();
            return;
        }
        if(id == "case"){
            print("case");
            @currentView = tabs[2];
            return;
        }
        if(id == "openCase"){
            print("openingcase");
            @currentView = tabs[tabs.Length-1];
            return;
        }

    }

    void viewToVoucher(){
        @currentView = tabs[1];

    }

    void openCase(){
        tabs.InsertLast(CaseOpenView(dc, this));
        changeTab("openCase");
    }

}