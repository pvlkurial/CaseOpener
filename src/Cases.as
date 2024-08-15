class Case : BaseItem{

    array<Skin@> skins;

    Case(const string &in name, const string &in texPath){
        m_name = name;
        m_texPath = texPath;
    }

}
