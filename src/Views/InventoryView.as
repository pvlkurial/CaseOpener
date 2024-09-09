class InventoryView : BaseView{

    // string id = "inventory";
    // bool closable = false;
    DataController@ m_dc;
    ViewController@ m_wc;

    InventoryView(DataController@ &in dc, ViewController@ &in wc){
        @m_dc = @dc;
        @m_wc = @wc;
        dc.loadTextures();
        id="inventory";
    }

    void showItem(const BaseItem@ &in item){
        UI::Image(item.m_tex);

    }

    void printData(const string &in data){
        print(data);
    }
    
    
    void template() override{
        UI::Text("Inventory View");
        UI::BeginTabBar("##tabbar", UI::TabBarFlags::None);

        if(UI::BeginTabItem("Cases", UI::TabItemFlags::None)){
            UI::BeginTable("##table", 3, UI::TableFlags::None);
            for(int i = 0; i < m_dc.getCases().Length; i++){
                //print(m_dc.getCases()[i].m_name);
                UI::TableNextColumn();
                UI::Image(@m_dc.getCases()[i].m_tex, vec2(150,150));
                if(UI::IsItemHovered()){
                    UI::SetItemTooltip("Open Case");
                }
                if(UI::IsItemClicked()){
                    m_wc.openCase();
                }
            }
            UI::EndTable();
        UI::EndTabItem();
        }
        if(UI::BeginTabItem("Skins", UI::TabItemFlags::None)){
            UI::BeginTable("##skinstable", 3, UI::TableFlags::None);
            for(int i = 0; i < m_dc.getSkins().Length; i++){
                UI::TableNextColumn();
                UI::Image(@m_dc.getSkins()[i].m_tex, vec2(150,150));
                if(UI::IsItemHovered()){
                    UI::SetItemTooltip("See Skin");
                }
                if(UI::IsItemClicked()){
                    m_wc.openCase();
                }
            }
            UI::EndTable();
            UI::EndTabItem();
        }
        UI::EndTabBar();

        if(UI::Button("getAllCases")){
            m_dc.getAllCases();
        }
        if(UI::Button("vouchers")){
            m_wc.changeTab("voucher");
        }
        if(UI::Button("Open a case")){
            m_wc.openCase();
        }
    }



}