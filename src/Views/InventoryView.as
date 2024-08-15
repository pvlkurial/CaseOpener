class InventoryView : BaseView{

    string id = "inventory";
    bool closable = false;
    void template() override{
        UI::Text("Inventory View");
    }

}