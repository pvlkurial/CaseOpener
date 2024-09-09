class DetailedCaseView : BaseView{

    DataController@ m_dc;
    ViewController@ m_wc;

    DetailedCaseView(DataController@ &in dc, ViewController@ &in wc){
        closable = false;
        @m_dc = @dc;
        @m_wc = @wc;
        id = "case";

    }

    void template() override {
        UI::Text("Detailed text");
    }
}