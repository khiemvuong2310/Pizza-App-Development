/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Models.Entity.OrderDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class OrderDetailsDAO {

    public Connection getConnection() throws Exception {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection cnn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;database=PizzaStore", "sa", "12345");
            return cnn;
        } catch (ClassNotFoundException | SQLException e) {
            throw e;
        }
    }

    public boolean addOrderDetails(OrderDetails orderDetails) throws Exception {
        Connection cnn = null;
        PreparedStatement ps = null;

        try {
            cnn = getConnection();
            String sql = "Insert OrderDetails values (?, ?, ?, ?)";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, orderDetails.getOrderId());
            ps.setString(2, orderDetails.getProductId());
            ps.setDouble(3, orderDetails.getUnitPrice());
            ps.setInt(4, orderDetails.getQuantity());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw e;
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
    }

    public List<OrderDetails> getOrderDetailsList() throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<OrderDetails> orderList = new ArrayList<>();
        OrderDetails order = null;
        String orderId, productId;
        int quantity;
        double unitPrice;

        try {
            cnn = getConnection();
            String sql = "Select * from OrderDetails";
            ps = cnn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                orderId = rs.getString(1);
                productId = rs.getString(2);
                unitPrice = rs.getDouble(3);
                quantity = rs.getInt(4);

                order = new OrderDetails(orderId, productId, unitPrice, quantity);
                orderList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return orderList;
    }

    public List<OrderDetails> getOrderDetailsByOrderId(String orderId) throws SQLException {
        Connection cnn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<OrderDetails> orderList = new ArrayList<>();
        OrderDetails order = null;
        String productId;
        int quantity;
        double unitPrice;

        try {
            cnn = getConnection();
            String sql = "Select ProductID, UnitPrice, Quantity from OrderDetails where orderId = ?";
            ps = cnn.prepareStatement(sql);
            ps.setString(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                productId = rs.getString(1);
                unitPrice = rs.getDouble(2);
                quantity = rs.getInt(3);

                order = new OrderDetails(orderId, productId, unitPrice, quantity);
                orderList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cnn != null) {
                cnn.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return orderList;
    }

}
