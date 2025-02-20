<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill - MEDI-SALES</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* General Styling */
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 850px;
            margin: 30px auto;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            backdrop-filter: blur(5px);
        }

        /* Header Styling */
        .header {
            background-color: #0056b3;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        .header h1 {
            font-size: 24px;
            margin: 0;
        }

        .header .home-btn {
            background-color: #fff;
            color: #0056b3;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            border: none;
        }

        .header .home-btn:hover {
            background-color: #0056b3;
            color: white;
            border: 2px solid white;
        }

        /* Footer Styling */
        footer {
            background-color: #f5f9fa;
            color: #333;
            text-align: center;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }

        /* Form Styling */
        h2 {
            margin-bottom: 20px;
            color: #0056b3;
        }

        h3 {
            color: #007bff;
        }

        .form-row {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .form-row .form-select,
        .form-row input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .form-row .col-md-3,
        .form-row .col-md-2 {
            padding-right: 10px;
        }

        .form-btn {
            background-color: #0056b3;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-btn:hover {
            background-color: #003d80;
        }

        .form-btn:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(0, 86, 179, 0.8);
        }

        /* Success Message Styling */
        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }

        /* Table Styling */
        #sales-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        #sales-table th,
        #sales-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        #sales-table th {
            background-color: #f5f9fa;
            font-weight: bold;
        }

        #maxStockMessage {
            font-size: 12px;
            color: blue;
            margin-top: 5px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
            }

            .form-btn {
                width: auto;
            }

            /* Adjust the size of the table on smaller screens */
            #sales-table th, #sales-table td {
                padding: 8px;
            }
        }

        @media (max-width: 576px) {
            /* Adjust input field sizes */
            .form-row .form-select,
            .form-row input {
                font-size: 12px;
            }

            /* Make the table scrollable on very small screens */
            #sales-table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <div class="logo-container">
            <img src="logo.png" alt="Medi-Sales Logo" style="height: 40px;">
        </div>
        <div class="btn-group">
            <button class="home-btn" onclick="window.history.back();">Back</button>
        </div>
    </div>

    <div class="container">
        <!-- Sales Bill Form -->
        <form method="post" action="getBill">
            <h2 id="page-title">Vendor Sales Bill</h2>
            <h3>Billing for : ${customerName}</h3>
            <p>Address: ${address}</p>

            <div class="row form-row">
                <div class="col-md-3">
                    <select name="productName" id="productName" class="form-select" required onchange="fetchProductStock()">
                        <option value="">Select Product</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <select name="customerName" id="customerName" class="form-select" required>
                        <option value="">Select Customer</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <input type="number" name="quantity" id="quantityEntered" class="form-control" placeholder="Quantity" required />
                    <div id="maxStockMessage"></div>
                </div>
                <div class="col-md-2">
                    <input type="number" name="gst" id="gstEntered" class="form-control" placeholder="GST (%)" required />
                </div>
                <div class="col-md-2">
                    <input type="number" name="discount" id="discountEntered" class="form-control" placeholder="Discount (%)" required />
                </div>
            </div>

            <!-- Submit Button -->
            <div class="form-row mt-3">
                <button type="submit" class="form-btn">Add</button>
                <a href="http://localhost:8080/medi_sales/generatePdf" class="form-btn" style="background-color: #28a745;">Generate PDF</a>
            </div>

                <div class="success-message">${success}</div>

        </form>

       <h3 class="mt-4">Sales Bill Details</h3>
               <table id="sales-table">
                   <thead>
                       <tr>
                           <th>Sl.no</th>
                           <th>Product</th>
                           <th>HSN No</th>
                           <th>Description</th>
                           <th>Exp. Date</th>
                           <th>Quantity</th>
                           <th>Mrp</th>
                           <th>GST</th>
                           <th>Discount</th>
                           <th>Total</th>
                       </tr>
                   </thead>
                  <tbody>
                      <c:forEach var="dto" items="${dtoList}" varStatus="status">
                          <tr>
                              <td>${status.index + 1}</td>
                              <td>${dto.productName}</td>
                              <td>${dto.hsn}</td>
                              <td>${dto.productCompany}</td>
                              <td>${dto.expDate}</td>
                              <td>${dto.quantity}</td>
                              <td>${dto.mrp}</td>
                              <td>${dto.gst}</td>
                              <td>${dto.discount}</td>
                              <td>${dto.totalAmount}</td>
                          </tr>
                      </c:forEach>
                  </tbody>

               </table>

               <!-- Total Amount -->
               <h4 class="mt-4 text-end" id="allTotal">Total: ${total}</h4>

           </div>
    <footer>
        <p>&copy; 2025 XWORKZ Cloud. All Rights Reserved.</p>
    </footer>

   <script>
           document.addEventListener("DOMContentLoaded", function() {
               fetchProducts();
               fetchCustomers();
           });

           function fetchProducts() {
               fetch('http://localhost:8080/medi_sales/api/getProducts')
                   .then(response => response.json())
                   .then(data => {
                       let selectElement = document.getElementById("productName");
                       selectElement.innerHTML = '<option value="">Select Product</option>';
                       data.forEach(product => {
                           let option = document.createElement("option");
                           option.value = product;
                           option.text = product;
                           selectElement.appendChild(option);
                       });
                   })
                   .catch(error => console.error('Error fetching products:', error));
           }

           function fetchCustomers() {
               fetch('http://localhost:8080/medi_sales/api/getCustomer')
                   .then(response => response.json())
                   .then(data => {
                       let selectElement = document.getElementById("customerName");
                       selectElement.innerHTML = '<option value="">Select Customer</option>';
                       data.forEach(customer => {
                           let option = document.createElement("option");
                           option.value = customer;
                           option.text = customer;
                           selectElement.appendChild(option);
                       });
                   })
                   .catch(error => console.error('Error fetching customers:', error));
           }

           function fetchProductStock() {
                                const name = document.getElementById("productName").value ;
                                console.log(name);
                                if (name) {
                                   fetch("http://localhost:8080/medi_sales/api/getStockByProduct?productName="+name)
                                        .then(response => response.json())
                                        .then(stock => {
                                            const maxStockMessage = document.getElementById("maxStockMessage");
                                            maxStockMessage.textContent = "Maximum quantity available is "+stock;

                                            const quantityInput = document.getElementById("quantityEntered");
                                            quantityInput.setAttribute("placeholder", "Enter quantity (max "+stock+")");
                                        })
                                        .catch(error => console.error('Error fetching product stock:', error));
                                        } else {
                                            const maxStockMessage = document.getElementById("maxStockMessage");
                                            maxStockMessage.textContent = '';

                                            const quantityInput = document.getElementById("quantityEntered");
                                            quantityInput.setAttribute("placeholder", "Enter quantity");
                                        }
                                    }
   </script>

</body>
</html>
