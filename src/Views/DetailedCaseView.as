class DetailedCaseView : BaseView{
    
    string id;
    bool closable = true;
    void template() override {
        UI::Text("Detailed text");
    }
}