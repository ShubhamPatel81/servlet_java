package bot;

import com.entity.itemDetails;
import com.groceryapp.entity.ItemDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemDAOImpl {
    private Connection conn;

    public ItemDAOImpl(Connection conn) {
        this.conn = conn;
    }

    public List<itemDetails> getRecentItems() {
        List<ItemDetails> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM items ORDER BY created_date DESC LIMIT 10";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ItemDetails item = new ItemDetails();
                item.setItemId(rs.getInt("id"));
                item.setItemName(rs.getString("name"));
                item.setPhotoName(rs.getString("photo"));
                item.setPrice(rs.getString("price"));
                // Add other fields as necessary
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
