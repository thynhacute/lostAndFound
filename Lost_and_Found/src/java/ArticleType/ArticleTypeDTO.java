
package ArticleType;

/**
 *
 * @author THAI
 */
public class ArticleTypeDTO {
    private int articleTypeID;
    private String articleTypeName;

    public ArticleTypeDTO(int articleTypeID, String articleTypeName) {
        this.articleTypeID = articleTypeID;
        this.articleTypeName = articleTypeName;
    }

    public int getArticleTypeID() {
        return articleTypeID;
    }

    public void setArticleTypeID(int articleTypeID) {
        this.articleTypeID = articleTypeID;
    }

    public String getArticleTypeName() {
        return articleTypeName;
    }

    public void setArticleTypeName(String articleTypeName) {
        this.articleTypeName = articleTypeName;
    }

    
    
}
