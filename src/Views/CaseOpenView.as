class CaseOpenView : BaseView{

    DataController@ m_dc;
    ViewController@ m_wc;

    CaseOpenView(DataController@ &in dc, ViewController@ &in wc){
        closable = false;
        @m_dc = @dc;
        @m_wc = @wc;
        id = "openCase";

    }

    void template() override {
        UI::Text("Opening a case");
        if(UI::Button("Open Case")){
            m_dc.addSkinToInv("first_case");
            m_wc.changeTab("inventory");
            m_wc.tabs.RemoveLast();
        }

    }
}