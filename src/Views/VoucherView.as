class VoucherView : BaseView{

    DataController@ m_dc;
    ViewController@ m_wc;

    VoucherView(DataController@ &in dc, ViewController@ &in wc){
        @m_dc = @dc;
        @m_wc = @wc;
        id = "voucher";
        closable = false;
    }
    
    
    void template() override{
        UI::Text("Voucher View");
        if(UI::Button("inventory##voucher")){
            m_wc.changeTab("inventory");
        }
    }

}