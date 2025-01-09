package com.foodapp.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodapp.DAO.MenuDAO;
import com.foodapp.dbutil.DBConnection;
import com.foodapp.model.Menu;

public class MenuDAOImpl implements MenuDAO {

    static ArrayList<Menu> menuList = new ArrayList<Menu>();

    private static final String INSERT = "insert into menu (menuid, restrauntid, name, description, price, isavailable, imagepath, category) values (?,?,?,?,?,?,?,?)";
    private static final String FETCHALL = "select * from menu";
    private static final String FETCHONE = "select * from menu where menuid=?";
    private static final String UPDATE = "update menu set name=?, description=?, price=?, isavailable=?, imagepath=?, category=? where menuid=?";
    private static final String DELETE = "delete from menu where menuid=?";
    private static final String FETCHMENUBYRESTRAUNTID = "select * from menu where restrauntid=?";
    private static Connection con;

    static {
        con = DBConnection.connect();
    }

    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet resultSet;
    private Menu m;

    @Override
    public int insert(Menu m) {
        try {
            pstmt = con.prepareStatement(INSERT);
            pstmt.setInt(1, m.getMenuId());
            pstmt.setInt(2, m.getRestrauntId());
            pstmt.setString(3, m.getName());
            pstmt.setString(4, m.getDescription());
            pstmt.setInt(5, m.getPrice());
            pstmt.setBoolean(6, m.isAvailable());
            pstmt.setString(7, m.getImagePath());
            pstmt.setString(8, m.getCategory());  // Adding category to insert query

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public ArrayList<Menu> fetchAll() {
        try {
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(FETCHALL);

            menuList = extractMenulistFromResultSet(resultSet);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public Menu fetchOne(int id) {
        try {
            pstmt = con.prepareStatement(FETCHONE);
            pstmt.setInt(1, id);
            resultSet = pstmt.executeQuery();

            m = extractMenulistFromResultSet(resultSet).get(0);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }

    private ArrayList<Menu> extractMenulistFromResultSet(ResultSet resultSet) {
        ArrayList<Menu> menuList = new ArrayList<>();  // Create a fresh list

        try {
            while (resultSet.next()) {
                menuList.add(new Menu(
                        resultSet.getInt("menuid"),
                        resultSet.getInt("restrauntid"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getBoolean("isAvailable"),
                        resultSet.getString("imagepath"),
                        resultSet.getString("category")  // Extract category from result set
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public int update(int menuId, int restrauntId, String name, String description, int price, boolean isAvailable,
                      String imagePath, String category) {
        try {
            pstmt = con.prepareStatement(UPDATE);
            pstmt.setString(1, name);
            pstmt.setString(2, description);
            pstmt.setInt(3, price);
            pstmt.setBoolean(4, isAvailable);
            pstmt.setString(5, imagePath);
            pstmt.setString(6, category);  // Set category in the update query
            pstmt.setInt(7, menuId);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int delete(int id) {
        try {
            pstmt = con.prepareStatement(DELETE);
            pstmt.setInt(1, id);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public ArrayList<Menu> fetchMenuByRestraunt(int restrauntId) {
        ArrayList<Menu> menuList = new ArrayList<>();  // Create a fresh list
        try {
            pstmt = con.prepareStatement(FETCHMENUBYRESTRAUNTID);
            pstmt.setInt(1, restrauntId);
            resultSet = pstmt.executeQuery();

            while (resultSet.next()) {
                menuList.add(new Menu(
                        resultSet.getInt("menuid"),
                        resultSet.getInt("restrauntid"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getInt("price"),
                        resultSet.getBoolean("isAvailable"),
                        resultSet.getString("imagepath"),
                        resultSet.getString("category")  // Retrieve category from result set
                ));
                System.out.println("Menu List size: " + menuList.size());

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return menuList;
    }

	@Override
	public ArrayList<Menu> fetchMenuByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Menu> fetchMenuByRestrauntAndCategory(int restrauntId, String category) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	@Override
	public boolean addMenu(Menu menu) {
		 String query = "INSERT INTO menu ( name, category, description, price, isavailable ) VALUES ( ?, ?, ?, ?, ?)";

	        try (PreparedStatement stmt = con.prepareStatement(query)) {
	           
	            stmt.setString(1, menu.getName());
	            stmt.setString(2, menu.getCategory());
	            stmt.setString(3, menu.getDescription());
	            stmt.setInt(4, menu.getPrice());
	            stmt.setBoolean(5, menu.isAvailable());
	            

	            int rowsAffected = stmt.executeUpdate();
	            System.out.println("Rows affected: " + rowsAffected);  // Debugging line
	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
    
	@Override
	public Menu getMenuById(int menuId) {
		String query = "select * from menu where menuid=?";
		
		Menu menu=null;
		try {
			PreparedStatement preparedStatement=con.prepareStatement(query);
			
			preparedStatement.setInt(1, menuId);
			ResultSet resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
				menu = new Menu();
				menu.setMenuId(resultSet.getInt("menuid"));
				menu.setName(resultSet.getString("name"));
				 menu.setPrice(resultSet.getInt("price"));
				 menu.setDescription(resultSet.getString("description"));
                 menu.setRestrauntId(resultSet.getInt("restrauntid"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public void addMenuItem(String name, String category, String description, int price, boolean isAvailable,
			String imagePath, int restaurantId) {
		 String sql = "INSERT INTO menu (restrauntid, name, category, description, price, isavailable, imagepath) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, restaurantId);
			pstmt.setString(2, name);       // name
            pstmt.setString(3, category);   // category
            pstmt.setString(4, description); // description
            pstmt.setInt(5, price);         // price (as int)
            pstmt.setBoolean(6, isAvailable); // isavailable
            pstmt.setString(7, imagePath);  // imagepath

            pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int updateMenuItem(int menuId, String name, String category, String description, int price,
	        boolean isAvailable) {
	    String sql = "UPDATE menu SET name = ?, category = ?, description = ?, price = ?, isavailable = ? WHERE menuid = ?";
	    
	    int rowsAffected = 0; // Initialize the rowsAffected variable
	    
	    try {
	        // Prepare the SQL statement
	        PreparedStatement pstmt = con.prepareStatement(sql);

	        // Debug: Print the values being passed
	        System.out.println("Updating menu item with menuId: " + menuId);
	        System.out.println("Name: " + name);
	        System.out.println("Category: " + category);
	        System.out.println("Description: " + description);
	        System.out.println("Price: " + price);
	        System.out.println("isAvailable: " + isAvailable);

	        // Set the values for the SQL statement
	        pstmt.setString(1, name);  // name
	        pstmt.setString(2, category);  // category
	        pstmt.setString(3, description);  // description
	        pstmt.setInt(4, price);  // price
	        pstmt.setBoolean(5, isAvailable);  // isavailable
	        pstmt.setInt(6, menuId);  // menuid

	        // Execute the update and get the number of affected rows
	        rowsAffected = pstmt.executeUpdate();
	        System.out.println("Rows affected: " + rowsAffected);

	        if (rowsAffected == 0) {
	            System.out.println("No rows were updated. The menuId might not exist in the database.");
	        } else {
	            System.out.println("Menu item updated successfully.");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("Error updating menu item.");
	    }

	    // Return the number of rows affected
	    return rowsAffected;
	}


	@Override
	public int deleteMenuItem(int menuId) {
		 String sql = "DELETE FROM menu WHERE menuid = ?";
		 
		 try {
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, menuId);
			 pstmt.executeUpdate();
		 }
		 catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		 }
		return menuId;
		
	}

	@Override
	public List<Menu> getMenuItems(int restaurantId) {
		List<Menu> menuItems =new ArrayList<Menu>();
		 String sql = "SELECT * FROM menu WHERE restrauntid = ?";
		 
		 try {
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setInt(1, restaurantId);
			 resultSet=pstmt.executeQuery();
			 
			 
			 while(resultSet.next()) {
				 Menu menu = new Menu();
	                menu.setMenuId(resultSet.getInt("menuid"));
	                menu.setRestrauntId(resultSet.getInt("restrauntid"));
	                menu.setName(resultSet.getString("name"));
	                menu.setCategory(resultSet.getString("category"));
	                menu.setDescription(resultSet.getString("description"));
	                menu.setPrice(resultSet.getInt("price"));
	                menu.setAvailable(resultSet.getBoolean("isavailable"));
	                menu.setImagePath(resultSet.getString("imagepath"));

	                menuItems.add(menu);
			 }
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		return menuItems;
	}

	@Override
	public Menu getMenuItem(int menuId) {
		 Menu menu = null;
	        String sql = "SELECT * FROM menu WHERE menuid = ?";
	        
	        try {
	        	pstmt=con.prepareStatement(sql);
	        	pstmt.setInt(1, menuId);
	        	resultSet=pstmt.executeQuery();
	        	
	        	if (resultSet.next()) {
	                menu = new Menu();
	                menu.setMenuId(resultSet.getInt("menuid"));
	                menu.setRestrauntId(resultSet.getInt("restrauntid"));
	                menu.setName(resultSet.getString("name"));
	                menu.setCategory(resultSet.getString("category"));
	                menu.setDescription(resultSet.getString("description"));
	                menu.setPrice(resultSet.getInt("price"));
	                menu.setAvailable(resultSet.getBoolean("isavailable"));
	                menu.setImagePath(resultSet.getString("imagepath"));
	            }
	        }
	        catch(Exception e) {
	        	e.printStackTrace();
	        }
			return menu;
	}

	@Override
	public int getTotalMenuItems(int restaurantId) {
		int count=0;
		 String query = "SELECT COUNT(*) FROM menu WHERE restrauntid = ?";
		 try {
			 pstmt=con.prepareStatement(query);
			 pstmt.setInt(1, restaurantId);
			 resultSet = pstmt.executeQuery();
			 if(resultSet.next()) {
				 count=resultSet.getInt(1);
			 }
		 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		 return count;
	}

	
}
