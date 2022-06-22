
package item;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dbutils.DBUtils;

/**
 *
 * @author Admin
 */
public class ItemDTO {

    private int itemID;
    private String itemName;

    public ItemDTO(int itemID, String itemName) {
        this.itemID = itemID;
        this.itemName = itemName;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    
}