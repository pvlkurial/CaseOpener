class BaseView {

    string id = "base";
    bool closable;
    bool selected;

    void template(){}
    void render() {
        template();
    }

    void swSelect(){
        selected = !selected;
    }
}